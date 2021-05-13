from future.utils import with_metaclass
from multiprocessing.pool import ThreadPool
import datetime
from collections import OrderedDict

import pandas as pd
import numpy as np
import abc, argparse, json, os, ray, logging
import threading, time, subprocess, copy, sys, signal

from uptune.src.template import JinjaParser
from uptune.opentuner.api import TuningRunManager
from uptune.opentuner.measurement import MeasurementInterface
from uptune.opentuner.resultsdb.models import Result
from uptune.opentuner.search.manipulator import ConfigurationManipulator
from uptune.opentuner.search.manipulator import (
    IntegerParameter, EnumParameter, PowerOfTwoParameter, 
    LogIntegerParameter, BooleanParameter, FloatParameter,
    PermutationParameter 
)
from uptune.plugins.causaldiscovery import notears
from uptune.database.globalmodels import *

argparser = argparse.ArgumentParser(add_help=False)
argparser.add_argument('--timeout', type=int, default=72000,
                       help="auto-tuning timeout in seconds")
argparser.add_argument('--runtime-limit', '-rt', type=int, default=7200,
                       help="kill process if runtime exceeds the time in seconds")
argparser.add_argument('--async-interval', '-it', type=int, default=300,
                       help="interval in seconds for async scheduler to check the task queue")
argparser.add_argument('--parallel-factor', '-pf', type=int, default=2,
                       help="number of processes spawned by Parallel Python")
argparser.add_argument('--params', '-params', type=str, default="",
                       help="search space definition in json")
argparser.add_argument('--learning-models', '-lm', action="append", default=[],
                       help="single or ensemble of learning models for space pruning")
argparser.add_argument('--training-data', '-td', type=str, default='',
                       help="path to training data (support csv / txt)")
argparser.add_argument('--offline', action='store_true',
                       help="enable re-training for multi-stage")
argparser.add_argument('--aws', action='store_true', default=False,
                       help="use aws s3 storage for publishing")
argparser.add_argument('--cfg', action='store_true', default=False,
                       help="display configuration on screen")
argparser.add_argument('--gpu-num', type=int, default=0,
                       help="max number of gpu for each task")
argparser.add_argument('--cpu-num', type=int, default=1,
                       help="max number of cpu for each task")

log = logging.getLogger(__name__)

def init(apply_best=False): # reset uptune env variables 
    if not os.getenv("EZTUNING"):
        os.environ["UPTUNE"] = "True"
        if apply_best: # apply best cfg
            os.environ["BEST"] = "True"

# run with the best 
def get_best():
    assert os.path.isfile("ut.temp/best.json"), \
           "best cfg does not exsit"
    with open("ut.temp/best.json", "r") as fp:
        cfg, res = json.load(fp)
    fp.close()
    return cfg, res

class ParallelTuning(with_metaclass(abc.ABCMeta, object)):
    """Abstract class for parallel tuning"""
    def __init__(self,
                 cls,
                 args=None,
                 node='localhost',
                 parallel_factor=None):
  
        self.cls         = cls                     # ray actor class 
        self.args        = args                    # arguments for control
        self.parallel    = args.parallel_factor    # num of parallel instances 
        self.search_limit = args.test_limit 
        self.best_qors   = list()
        self.best_config = None
        self.tempdir     = "ut.temp"
        self.history     = "../ut.archive.csv"

        self._pending    = list()                  # pending configs being validated
        self._prev       = False                   # whether recovering from history 
        self._valid      = False                   # whether pruning is enabled
        self._ratio      = 0.3                     # pruning score percentage threshold
        self._interval   = args.async_interval     # interval for checking the task pool
        self._mapping    = dict()                  # mappin from Enum to Int
        self._models     = list()                  # pretrained ML model list
        self._apis       = list()
        self._actors     = list()
        self._archive    = list()
        self._glbsession = list()
  
    def init(self): 
        path = f"{self.tempdir}/uptune.db"
        if not os.path.isdir(path):
            os.makedirs(path, exist_ok=True)
        if self.args.database == None:
            self.args.database = f"sqlite:///{self.tempdir}/global"
  
    # Switch to ut.temp workdir and create symbolic links
    def prepare_workdir(self, copy=False):
        with open(self.args.params) as f:
            self.params = json.load(f)
        # If not reusing the parameters JSON
        # from last run, then move the params JSON into workdir
        if os.path.isfile("ut.params.json"):
            os.system("mv ut.*.json ut.temp/")

        # Create symbolic links
        work_dir = os.getenv("UT_WORK_DIR")
        for idx in range(self.parallel):
            thread_dir = f"{self.tempdir}/temp.{idx}"
            os.system(f"mkdir -p {thread_dir} > /dev/null")
            os.chdir(f"{thread_dir}")

            for f in os.listdir(work_dir):
                if not f.startswith("ut."):
                    os.system(f"ln -s {work_dir}/{f} .")
            os.chdir(work_dir)
        os.chdir(self.tempdir)
        # ray.init(redis_address="localhost:6379")
        ray.init(logging_level=logging.FATAL)
  
  
    def create_tuning(self, index, stage, manipulator):
        args = self.args
        args.database = "sqlite:///" + os.path.join('uptune.db', 
                                                    str(index) + \
                                                    '-' + str(stage) + '.db')
        # keep meas-interface for tuners
        interface = MeasurementInterface(args=args,
                        manipulator=manipulator,
                        project_name='tuning',
                        program_name='tuning',
                        program_version='0.1')
        api = TuningRunManager(interface, args)
        return api
  
  
    def global_report(self, stage, epoch, api, node, cfg, requestor, result, flag=False):
        if result < self.best_qors[stage] or self.best_qors[stage] == None:
            self.best_qors[stage] = result
            if stage == 0: # save best cfg
                self.best_config = cfg
                with open("best.json", "w") as fp:
                    json.dump([cfg, result], fp)
            flag = True
  
        # remove the config from pending list
        if requestor != "seed":
            assert cfg in self._pending, str(self._pending)
            self._pending.remove(cfg)

        api.manipulator.normalize(cfg)
        hashv = api.manipulator.hash_config(cfg)
        g = GlobalResult(epoch = epoch, 
                         node  = node, 
                         data  = cfg,
                         hashv = hashv,
                         time  = datetime.datetime.now(),
                         technique = requestor,
                         result = result,
                         was_the_best = flag)  
        self._glbsession[stage].add(g)
        self._glbsession[stage].flush()
        self._glbsession[stage].commit()
        return g
  
    def synchronize(self, stage, api, node, epoch):
        """ Synchronize results between different bandits """
        if epoch == 0: pass
        # Get the results from the same epoch of other nodes
        q = GlobalResult.extract(self._glbsession[stage], node, epoch) 
        api.sync(q)
  
    def create_params(self, stage=0):
        manipulator = ConfigurationManipulator()
        for item in self.params[stage]:
            ptype, pname, prange = item
            if ptype == "IntegerParameter": 
                manipulator.add_parameter(IntegerParameter(pname, prange[0], prange[1]))
            elif ptype == "EnumParameter": 
                manipulator.add_parameter(EnumParameter(pname, prange))
                self._mapping[pname] = dict([(y,x) for x,y in enumerate(set(prange))])
            elif ptype == "FloatParameter": 
                manipulator.add_parameter(FloatParameter(pname, prange[0], prange[1]))
            elif ptype == "LogIntegerParameter": 
                manipulator.add_parameter(LogIntegerParameter(pname, prange[0], prange[1]))
            elif ptype == "PowerOfTwoParameter": 
                manipulator.add_parameter(PowerOfTwoParameter(pname, prange[0], prange[1]))
            elif ptype == "BooleanParameter": 
                manipulator.add_parameter(BooleanParameter(pname))
            elif ptype == "PermutationParameter": 
                manipulator.add_parameter(PermutationParameter(pname, prange))
            else: assert False, "unrecognized type " + ptype
        return manipulator
           
    def tempdir(self, name):
        self.temp = "ut.temp"
        if not os.path.exists(self.temp):
            os.mkdir(self.temp)
        return os.path.join(self.temp, name)
  
    # Program executor for profiling before tuning 
    def call_program(self, cmd, limit=None, memory_limit=None):
        kwargs = dict()
        subenv = os.environ.copy()
        subenv["UT_BEFORE_RUN_PROFILE"] = "On"
        if limit is float('inf'):
            limit = None
        if type(cmd) in (str, str):
            kwargs['shell'] = True
            kwargs['env'] = subenv
            
        killed = False
        t0 = time.time()

        # save the log for debugging
        def target():
            out_log = os.path.join(self.tempdir, "ut.profile.log")
            err_log = os.path.join(self.tempdir, "ut.profile.err")

            file_out = open(out_log, "w")
            file_err = open(err_log, "w")
            self.process = subprocess.Popen(
                cmd, stdout=file_out, stderr=file_err,
                preexec_fn=os.setsid,
                **kwargs)
            self.stdout, self.stderr = self.process.communicate()
        
        thread = threading.Thread(target=target)
        thread.start()

        thread.join(limit)
        if thread.is_alive():
            killed = True
            # self.process.terminate()
            os.killpg(os.getpgid(self.process.pid), signal.SIGTERM)
            self.process.kill()
            self.stdout, self.stderr = self.process.communicate()
            thread.join()

        t1 = time.time()
        return {'time': float('inf') if killed else (t1 - t0),
                'timeout': killed,
                'returncode': self.process.returncode,
                'stdout': self.stdout,
                'stderr': self.stderr}
  
  
    def unique(self, api, stage, desired_result):
        """ Get a unique desired result. report result if duplicates """
        assert desired_result != None, "Invalid Desired Result"
        cfg = desired_result.configuration.data
        hashv = self.hash_cfg(api, desired_result)
  
        q = GlobalResult.get(self._glbsession[stage], hashv, cfg)
        if q == None:
            # TODO: fix or remove sql-alchemy
            # Check the pandas dataframes
            if os.path.exists(self.history):
                keys = [ item[1] for item in self.params[0] ]
                df = pd.read_csv(self.history)

                check = [ df[k]==v for k, v in cfg.items() ]
                dup = check.pop()
                while len(check) > 0:
                    dup &= check.pop()
                if dup.any():
                    result = Result(time=1) 
                    api.report_result(desired_result, result)
                    return False
            return True
        else:
            result = Result(time=q.result) 
            api.report_result(desired_result, result)
            return False
  
  
    def hash_cfg(self, api, desired_result):
        """ Get the hash value of desired_result """
        cfg = desired_result.configuration.data
        api.manipulator.normalize(cfg)
        hashv = api.manipulator.hash_config(cfg)
        return hashv
  
  
    def training(self, model_list, stage=0):
        """ Initialize ML models with offline data """
        if len(model_list) > 0: 
            self._valid = True
  
            for item in self.params[stage]:
                ptype, pname, prange = item
                if ptype == "EnumParameter": 
                   self._mapping[pname] = dict([(y,x+1) for x,y \
                                               in enumerate(sorted(set(prange)))])
  
            from uptune.plugins import models
            return copy.deepcopy(models.ensemble(model_list, self._mapping))
        return []
  
  
    def multivoting(self, stage, desired_result):
        """ 
        avergaing predicative scores from self.modesl 
        return True if the proposal prediction ranks top 30% over history 
        """
        results = (self._glbsession[stage].query(GlobalResult.result)
                   .order_by(asc(GlobalResult.result)).all()) 
        if len(results) == 0: 
            return True 

        # TODO: decide wether multi-stage use multi-voting or not
        return True
  
        threshold = results[0][0] + self._ratio * (results[-1][0] - results[0][0]) 
        scores = [model.inference(desired_result.configuration.data) 
                      for model in self._models]
        average = sum(scores) / len(scores) 
  
        if average < threshold: return True 
        else: return False
  
    def resume(self):
        # Recover the decoded pattern
        if os.path.isfile(self.history):
            print("[ INFO ] Found history records. Trying to re-load the search records...")
            data = pd.read_csv(self.history)

            # Check if the archive is for this tuning task 
            cols = [ _[1] for _ in self.params[0] ]
            if not set(cols).issubset(set(data.columns)):
                 log.info('archive mismatch. delete archive') 
                 os.system('rm ' + self.history)
                 return False

            columns = data.columns[1:-1]
            for col in columns:
                if col in self._mapping:
                    cands = [item[-1] for item in self.params[0] if item[1] == col][0]
                    mapping = dict([(i+1, cands[i]) for i in range(len(cands))])
                    data[col].replace(mapping, inplace=True)

            def convert(x):
               try: return int(x) if not "." in x else float(x)
               except: # non-numerical values 
                   try: # convert a perm list
                       x = x.strip('][').split(', ')
                       return [int(_) if not "." in _ else float(_) for _ in x]
                   except: return x

            # Report datas to global database
            for d in data.values: 
                d = d[1:-1]; qor = float(d[-1])
                cfg = dict([(columns[i], convert(d[i])) for i in range(len(self.params[0]))])
                self.global_report(0, 0, self._apis[0], 0, cfg, 'seed', qor)

            self._prev = len(data.values) - 1
            return len(data.values) - 1
  
    def prune(self, api, stage, desired_result):
        """ Prune away duplicate and unpromising proposals """
        if self.unique(api, stage, desired_result) == True:
            # use ML model pruning 
            if self._valid == True:  
                assert len(self._models) > 0, "No model available"
                # generate a weighed score from the model ensemble
                if self.multivoting(stage, desired_result) == True: 
                    return True
                else: 
                    return False 
            # Checking if the dr is being validated
            # TODO: the comparison does not work for object enum
            config = desired_result.configuration.data
            if config in self._pending:
                return False
            self._pending.append(desired_result.configuration.data)
            return True 
        return False

    # Encode enum iterm into an index number
    def encode(self, key, val):
        if key in self._mapping: 
            try:
                return self._mapping[key][val] 
            except:
                print(self._mapping, key, value)
                raise RuntimeError("key error")
        # Permutation type
        elif isinstance(val, list):
            return [val] 
        return val

    # Async task scheduler
    def async_execute(self, template=False):
        self._apis = [self.create_tuning(x, 0, self.create_params()) 
                          for x in range(self.parallel)]
  
        # Create ray actors
        actors = []
        for p in range(self.parallel):

            name = "uptune_actor_p{}".format(p)
            actor = self.cls.options(name=name).remote(p, 0, self.args) 
            actors.append(actor)
  
        # user specified training data + models 
        self._models = self.training(self.args.learning_models) 
  
        # restore history search result
        prev = self.resume()
        start_time = time.time() 

        # the trials that have been validated
        trial_num = 0
        # all the trails (including running ones)
        global_id_base = 0
        # accumulate validation qors and report
        new_qor_count = 0
        # lists saving local validation qors
        local_results = []
        local_build_times = []

        def get_config(task_list, drs):
            cfgs = dict()
            for index in task_list:
                desired_result = None
                api = self._apis[index]
                while desired_result is None:
                    try: desired_result = api.get_next_desired_result()
                    except: desired_result = None

                # prune and report back to opentuner database 
                while self.prune(api, 0, desired_result) == False:
                    log.warning("duplicate configuration request by %s from node %d", 
                        desired_result.requestor,
                        self._apis.index(api))
                    desired_result = api.get_next_desired_result()

                drs[index] = desired_result
                cfgs[index] = desired_result.configuration.data
            return drs

        # distribute desired results across nodes
        # check the task queue every a few mins
        not_reach_limit = True
        free_task_list = [ _ for _ in range(self.parallel) ]
        keys = [ item[1] for item in self.params[0] ]


        # objects list saves the pending tasks
        objects = list()
        drs = dict()
        while not_reach_limit:
            # Prepare inputs for free threads

            # The new desired result will overwrite the old ones
            drs = get_config(free_task_list, drs)
            if not template: 
                measure_num = trial_num
                if self._prev and trial_num == 0: 
                    measure_num += (self._prev + 1)
                    global_id_base += (self._prev + 1)

                # Prepare meta-data for searching instances
                # Each thread should be assigned with a new global ID
                meta = {"UT_MEASURE_NUM": measure_num, 
                        "UT_WORK_DIR": os.path.abspath("../"),
                        "UT_TEMP_DIR": os.path.abspath("../ut.temp")}
                self.publish(drs, stage=0, meta=meta)

            # Invoke remote executors
            for index in free_task_list:
                target_config = drs[index].configuration.data
                print(f"[ DEBUG ] GID({global_id_base}) dispatch new task on node {index}: {target_config}")
                obj = actors[index].run.remote(drs[index], global_id_base) 
                objects.append(obj)
                global_id_base += 1

            free_task_list = []

            # List of QoRs returned from the raylet runners
            # Format [ index, {co-variates}, eval_time, QoR ]
            # Check the executor pool periodically
            while True:
                qors, not_ready_refs = ray.wait(objects, timeout=self._interval)
                objects = not_ready_refs
                print("[ DEBUG ] Checking wait time", len(qors), self._interval)
                if (len(qors) > 0):
                    new_qor_count += len(qors)
                    results, covars, eval_times, gids = [], [], [], []
                    for qor in qors:
                        gid, index, covar_list, eval_time, target = ray.get(qor)
                        print(f"[ DEBUG ] Free node #{index} (GID{gid})")
                        free_task_list.append(index)
                        eval_times.append(eval_time)
                        results.append(target)
                        covars.append(covar_list)
                        gids.append(gid)

                        # Local result logging
                        local_results.append(target)
                        local_build_times.append(eval_time)

                    # Report and synchronize between apis
                    results = [ Result(time=target) for target in results ]
                    count = 0
                    global_results_sync = dict()
                    for index in free_task_list:
                        api = self._apis[index]
                        dr = drs[index]
                        result = results[count]
                        build_time = eval_times[count]
                        covar = covars[count]
                        gid = gids[count]

                        api.report_result(dr, result)
                        gr = self.global_report(0, trial_num, api, index, 
                                           dr.configuration.data, 
                                           dr.requestor,
                                           result.time)
                        global_results_sync[index] = gr

                        # Save res for causal dicovery update
                        vals = OrderedDict([(key, self.encode(key, dr.configuration.data[key])) for key in keys]) 
                        elapsed_time = time.time() - start_time

                        # Check whether prev result exist
                        if self._prev and trial_num == 0: 
                            trial_num = trial_num + self._prev + 1
                        is_best = 1 if result.time == self.best_qors[0] else 0
                        df = pd.DataFrame({"gid": gid, "time" : elapsed_time, **vals, **covar, 
                                           "build_time" : build_time,
                                           "qor" : result.time, "is_best" : is_best}, 
                                           columns=["gid", "time", *keys, *covar.keys(), "build_time", "qor", "is_best"],
                                           index=[trial_num])
                        header = ["gid", "time", *keys, *covar.keys(), "build_time", "qor", "is_best"]
                        df.to_csv(self.history, mode='a', index=False, 
                                  header=False if trial_num > 0 else header)
                        trial_num += 1
                        count += 1
                        
                    # Update the new results to other nodes (apis) 
                    for index, gr in global_results_sync.items():
                        api_count = 0
                        for api in self._apis:
                            if api_count != index: 
                                api.sync([gr])
                            api_count += 1
                    break

            # report local result every self.parallel qors return
            if new_qor_count >= self.parallel:
                new_qor_count = 0
                rets = np.array(local_results)
                eval_times = np.array(local_build_times)

                try:
                    local_worst = np.nanmax(rets[rets != np.inf])
                    local_best  = np.nanmin(rets[rets != np.inf])
                except:
                    local_best = float("inf")
                    local_worst = float("inf")
                max_build_time = np.nanmax(eval_times[eval_times != np.inf])

                global_best = self.best_qors[0] if self.best_qors else local_best
                if local_best < global_best: global_best = local_best

                print("[ INFO ] {}(#{}/{})".\
                        format(str(datetime.timedelta(seconds=int(elapsed_time))),
                            trial_num, self.search_limit) + \
                    " - QoR LW({:05.2f})/LB({:05.2f})/GB({:05.2f}) - build time({:05.2f}s)".\
                        format(local_worst, local_best, global_best, max_build_time))
                local_results = []
                local_build_times = []
                
            elapsed_time = time.time() - start_time
            if trial_num > self.search_limit: 
                print(trail, self.search_limit)
                not_reach_limit = False
            if elapsed_time > float(self.args.timeout): 
                not_reach_limit = False
                print(elapsed_time)
            if not_reach_limit == False:
                print("[ INFO ] Search ends. Global best {}".format(self.best_qors[0]))

        # End of execution 
        for api in self._apis:
            api.finish()
        return self.best_config        
  
    def main(self, template=False):
        self._apis = [self.create_tuning(x, 0, self.create_params()) 
                          for x in range(self.parallel)]
        # Create ray actors
        actors = []
        for p in range(self.parallel):
            name = "uptune_actor_p{}".format(p)
            actor = self.cls.options(name=name).remote(p, 0, self.args) 
            actors.append(actor)
  
        # user specified training data + models 
        self._models = self.training(self.args.learning_models) 
  
        # restore history search result
        prev = self.resume()
        start_time = time.time() 

        # the main searching loop
        for epoch in range(self.search_limit):
            drs, cfgs = list(), list()
            for api in self._apis:
                desired_result = None

                while desired_result is None:
                    try: desired_result = api.get_next_desired_result()
                    except: desired_result = None
  
                # prune and report back to opentuner database 
                while self.prune(api, 0, desired_result) == False:
                    log.warning("duplicate configuration request by %s from node %d", 
                        desired_result.requestor,
                        self._apis.index(api))
                    desired_result = api.get_next_desired_result()
  
                drs.append(desired_result)
                cfgs.append(desired_result.configuration.data)
            
            # assert and run in parallel with ray remote
            # truncate = lambda x: x + "..." if len(x) > 75 else x
            assert len(cfgs) == self.parallel, \
                "All available cfgs have been explored"

            # distribute desired results across nodes
            base = epoch * self.parallel 
            if not template: 
                measure_num = base
                if self._prev: measure_num += (self._prev + 1)
                meta = {"UT_MEASURE_NUM": measure_num, 
                        "UT_WORK_DIR":    os.path.abspath("../")}
                self.publish(drs, stage=0, meta=meta)
            objects = [ actor.run.remote(drs[actors.index(actor)]) 
                          for actor in actors ]

            # List of QoRs returned from the raylet runners
            # Format [ index, {co-variates}, eval_time, QoR ]
            # qors = ray.get(objects, timeout=self.args.runtime_limit+10)

            # Check the executor pool periodically (5 mins)
            interval = 5 * 60
            qors, not_ready_refs = ray.wait(objects, 
                num_returns=self.parallel, timeout=self.args.runtime_limit)

            # Dispatch the tasks asynchronously 
            results, covars, eval_times = [], [], []
            for index in range(len(objects)):
                item = objects[index]
                if item in qors:
                    index, covar_list, eval_time, target = ray.get(item)
                    eval_times.append(eval_time)
                    results.append(target)
                    covars.append(covar_list)
                
                # Cancel timeed-out tasks
                else:
                    assert item in not_ready_refs, "Not found object ref"
                    # Kill the dead actor and create a new actor 
                    print("[ WARNING ] Thread #{} timed-out. Creating new actor...".format(index))
                    del actors[index]
                    new_actor = self.cls.remote(index, 0, self.args) 
                    actors.insert(index, new_actor)

                    eval_times.append(float("inf"))
                    results.append(float("inf"))
                    covars.append({})                   
  
            elapsed_time = time.time() - start_time
            rets = np.array(results)
            eval_times = np.array(eval_times)

            local_worst = np.nanmax(rets[rets != np.inf])
            local_best  = np.nanmin(rets[rets != np.inf])
            max_build_time = np.nanmax(eval_times[eval_times != np.inf])
            global_best = self.best_qors[0] if self.best_qors else local_best
            if local_best < global_best: global_best = local_best
            
            print("[ INFO ] {}(#{}/{})".\
                    format(str(datetime.timedelta(seconds=int(elapsed_time))),
                        epoch * self.parallel, self.search_limit) + \
                " - QoR LW({:05.2f})/LB({:05.2f})/GB({:05.2f}) - build time({:05.2f}s)".\
                    format(local_worst, local_best, global_best, max_build_time))

            keys = [ item[1] for item in self.params[0] ]
            results = [ Result(time=target) for target in results ]

            for api, dr, covar, build_time, result \
                in zip(self._apis, drs, covars, eval_times, results):
                api.report_result(dr, result)
                self.global_report(0, epoch, api,
                                   self._apis.index(api), 
                                   dr.configuration.data, 
                                   dr.requestor,
                                   result.time)

                # Save res for causal dicovery update
                index = base + drs.index(dr)
                vals = OrderedDict([(key, self.encode(key, dr.configuration.data[key])) for key in keys]) 
                
                # Check whether prev result exist
                if self._prev: index = index + self._prev + 1
                is_best = 1 if result.time == self.best_qors[0] else 0
                df = pd.DataFrame({"time" : elapsed_time, **vals, **covar, 
                                   "build_time" : build_time,
                                   "qor" : result.time, "is_best" : is_best}, 
                                   columns=["time", *keys, *covar.keys(), "build_time", "qor", "is_best"],
                                   index=[index])
                header = ["time", *keys, *covar.keys(), "build_time", "qor", "is_best"]
                df.to_csv(self.history, mode='a', index=False, 
                          header=False if index > 0 else header)
  
            for api in self._apis: # sync across nodes
                self.synchronize(0, api, self._apis.index(api), epoch)

            # update causal baysien graph 
            # if epoch % 10 == 0:
            #     data = pd.read_csv('../archive.csv')
            #     data = (data-data.mean())/data.std()
            #     print(notears(data.values[:, 2:-1]))

            # time check and plot diagram
            if elapsed_time > float(self.args.timeout): 
                log.info('%s runtime exceeds timeout %ds. global_best is %f', 
                             str(datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")),
                             int(elapsed_time), self.best_qors[0])
                break 
  
        # End of execution 
        for api in self._apis:
            api.finish()

        log.info('%s tuning complete. global_best is %f', 
                     str(datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")),
                     self.best_qors[0] if self.best_qors else float('inf'))
        return self.best_config


    # Fine-grained auto-tuning control 
    def set_actor_cls(self, actor):
        """ Set actor cls from builder and tmpl """
        self.cls = actor

    def create_instances(self):
        """ Create single-stage api controller, ray actors and ML model instances"""
        self._actors = [self.cls.remote(_, 0, self.args) 
                            for _ in range(self.parallel)]
        self._apis = [self.create_tuning(x, 0, self.create_params()) 
                          for x in range(self.parallel)]
        self._models = self.training(self.args.learning_models) 

    def finish_tuning(self):
        """ Return best configuration """
        best_cfgs = [api.get_best_configuration() for api in self._apis]
        for api in self._apis:
            try: api.finish()
            except: pass
        return best_cfgs
        
    def generate_dr(self): 
        """ Singe-stage generate desired result """
        drs, idxs = list(), list()
        for api in self._apis:
            desired_result = api.get_next_desired_result()
            if desired_result is None:
                continue
  
            while self.prune(api, 0, desired_result) == False:
                log.warning("duplicate configuration request by %s from node %d", 
                    desired_result.requestor,
                    self._apis.index(api))
                desired_result = api.get_next_desired_result()
  
            drs.append(desired_result)
            idxs.append(self._apis.index(api))

        assert len(drs) == self.parallel, \
               "All available cfgs have been explored"
        return drs, idxs 

    def rpt_and_sync(self, epoch, drs, results, mapping=None, stage=0):
        """ report and synchronize result """
        log.info('Global best qor %f', 
            self.best_qors[stage] if self.best_qors is not None else float('inf'))

        idxs = tuple([mapping[_] for _ in drs]) if mapping else None
        apis = [self._apis[i] for i in idxs] if idxs else self._apis  
        for api, dr, result in zip(apis, drs, results):
            api.report_result(dr, result)
            self.global_report(stage,
                               epoch, 
                               api,
                               self._apis.index(api), 
                               dr.configuration.data, 
                               dr.requestor,
                               result.time)
  
        for api in self._apis:
            self.synchronize(stage, api, self._apis.index(api), epoch)

class RunProgram(object):
    """
    Ray Actor to be called by object of ParallelTuning Class
    Extending dataflow from functional programming  
    Reference: https://ray.readthedocs.io/en/latest/actors.html
    """
    def __init__(self, index, stage, args=None):
        self.index       = index             
        self.stage       = stage
        self.args        = args
        self.global_id   = 0
        self.workpath    = None
        self.process     = None
        self.stdout      = str()
        self.stderr      = str()
        self.dumper      = JinjaParser() 

    # Invoked by runner before starting tuning
    def start_run(self, nodes=1):
        # Running tuning tasks in a single-node machine
        # when running across multiple compute nodes (not sharing the same FS)
        # search instances need to find available nodes 
        if nodes == 1: 
            self.workpath = f"temp.{self.index}"
            dir_in_use = self.workpath + '-inuse'
            if not os.path.isdir(dir_in_use):
                os.rename(self.workpath, dir_in_use)
            os.chdir(self.workpath + '-inuse')

        else: 
            for folder in next(os.walk('.'))[1]:
                if folder.isdigit():
                    self.workpath = folder
                    os.rename(folder, folder + '-inuse')
                    os.chdir(folder + '-inuse')
                    break

    def end_run(self):
        os.chdir("../")
        os.rename(self.workpath + '-inuse', self.workpath)

    def set_global_id(self, global_id):
        self.global_id = global_id

    def call_program(self, cmd, aws=False, sample=False, 
                     limit=None, memory_limit=None):
        kwargs = dict()
        subenv = os.environ.copy()
        subenv["UT_TUNE_START"] = "True"
        subenv["UT_CURR_INDEX"] = str(self.index)
        subenv["UT_CURR_STAGE"] = str(self.stage)
        subenv["UT_GLOBAL_ID"]  = str(self.global_id)

        # early exit in multistage & aws
        if sample: subenv["UT_MULTI_STAGE_SAMPLE"] = "True"
        if aws: subenv["UT_AWS_S3_BUCKET"] = "True"

        if limit is float('inf'):
            limit = None
        if type(cmd) in (str, str):
            kwargs['shell'] = True
            kwargs['env'] = subenv

        killed = False
        t0 = time.time()

        def target():
            out_log = f"../stage{self.stage}_node{self.index}.out"
            err_log = f"../stage{self.stage}_node{self.index}.err"
            file_out = open(out_log, "a+")
            file_err = open(err_log, "a+")
            self.process = subprocess.Popen(
                cmd, stdout=file_out, stderr=file_err,
                preexec_fn=os.setsid,
                **kwargs)
            self.stdout, self.stderr = self.process.communicate()
        
        thread = threading.Thread(target=target)
        thread.start()

        thread.join(limit)
        if thread.is_alive():
            killed = True
            # self.process.terminate()
            os.killpg(os.getpgid(self.process.pid), signal.SIGTERM)
            self.process.kill()
            self.stdout, self.stderr = self.process.communicate()
            thread.join()

        t1 = time.time()
        return {'time': float('inf') if killed else (t1 - t0),
                'timeout': killed,
                'returncode': self.process.returncode,
                'stdout': self.stdout,
                'stderr': self.stderr}

    def run(self, dr):
        raise RuntimeError("ParallelTuning.run() not implemented")
    

# Expr for Functional Module Reuse
class ProgramTune(ParallelTuning):
    def __init__(self, cls, args, *pargs, **kwargs):
        super(ProgramTune, self).__init__(cls, args, *pargs, **kwargs)
        self.prepare_workdir()


@ray.remote
class SingleProcess(RunProgram): 
    def run(self, dr):
        import random
        os.system('sleep 10')
        return random.randint(0, 10)

if __name__ == '__main__':
    argparser = uptune.default_argparser()
    pt = ProgramTune(SingleProcess, argparser.parse_args())
    pt.main()
  
