from future.utils import with_metaclass
from multiprocessing.pool import ThreadPool
from datetime import datetime
import abc, argparse, json, os, ray, logging
import threading, time, subprocess, copy, sys

from uptune.utils.jinjatpl import JinjaParser
from uptune.opentuner.api import TuningRunManager
from uptune.opentuner.measurement import MeasurementInterface
from uptune.opentuner.resultsdb.models import Result
from uptune.opentuner.search.manipulator import ConfigurationManipulator
from uptune.opentuner.search.manipulator import (
    IntegerParameter, EnumParameter, PowerOfTwoParameter, 
    LogIntegerParameter, BooleanParameter, FloatParameter 
)
from uptune.globaldb.globalmodels import *
from uptune.opentuner.measurement.interface import (
    goodwait, goodkillpg, preexec_setpgid_setrlimit
)

argparser = argparse.ArgumentParser(add_help=False)
argparser.add_argument('--timeout', type=int, default=36000,
                       help="auto-tuning timeout in seconds")
argparser.add_argument('--parallel-factor', '-pf', type=int, default=2,
                       help="number of processes spawned by Parallel Python")
argparser.add_argument('--params-json', '-pj', type=str, default="params.json",
                       help="search space definition in json")
argparser.add_argument('--runtime-limit', '-rt', type=int, default=1800,
                       help="kill process if runtime exceeds {} seconds")
argparser.add_argument('--learning-models', '-lm', action="append", default=[],
                       help="single or ensemble of learning models for space pruning")
argparser.add_argument('--training-data', '-td', type=str, default='',
                       help="path to training data (import atumatically with extension detection)")
argparser.add_argument('--offline', action='store_true',
                       help="enable re-training for multi-stage")
argparser.add_argument('--aws', action='store_true', default=False,
                       help="use aws s3 storage for publishing")
argparser.add_argument('--gpu-num', type=int, default=1,
                       help="max number of gpu for each task")
argparser.add_argument('--cpu-num', type=int, default=1,
                       help="max number of cpu for each task")

log = logging.getLogger(__name__)

class ParallelTuning(with_metaclass(abc.ABCMeta, object)):
    """
    abstract class for parallel tuning 
    """
    def __init__(self,
                 cls,
                 args=None,
                 node='localhost',
                 parallel_factor=None):
  
        self.cls         = cls                     # ray actor class 
        self.args        = args                    # arguments for control
        self._parallel   = args.parallel_factor    # num of parallel instances 
        self._json       = args.params_json        # add to opentuner manipulator
        self._nodes      = tuple(node.split(','))
        self._limit      = args.test_limit 
        self._best       = list()
        self._cfg        = None
        self._valid      = False                   # whether pruning is enabled
        self._ratio      = 0.3                     # pruning score percentage threshold
        self._mapping    = dict()                  # mappin from Enum to Int
        self._models     = list()                  # pretrained ML model list
        self._apis       = list()
        self._actors     = list()
        self._archive    = list()
        self._glbsession = list()
        self.pids        = list()
        self.pid_lock    = threading.Lock()
        self.thread_pool = None 
        self.init()
  
  
    def init(self): 
        """
        set the process/mode to run: process nunber = floor (pf / node)
        connect to the global db for mab and global results
        """
        path = '__tmp__/uptune.db'
        if not os.path.isdir(path):
            os.makedirs(path, exist_ok=True)
        if self.args.database == None:
            self.args.database = 'sqlite:///__tmp__/global-'
  
  
    def before_run(self, copy=False):
        """ 
        create __tmp__ folder before run
        """
        with open(self._json) as f:
            self._params = json.load(f)
        f.close()
  
        if copy == True:
            exclude = ' -x __tmp__/\* default.json feats.json'
            os.system('zip -r tune.zip *' + exclude + '> /dev/null')
            for idx in range(self._parallel):
                os.system('mkdir __tmp__/' + str(idx) + ' > /dev/null')
                os.system('unzip -o tune.zip -d __tmp__/' + \
                          str(idx) + ' > /dev/null')
            os.system('rm -f tune.zip')

        # clean and move to __tmp__
        os.system('rm -f feats.json params.json default.json')
        os.chdir('__tmp__')

        # init ray cluster 
        # ray.init(redis_address="localhost:6379")
        ray.init()
  
  
    def create_tuning(self, index, stage, manipulator):
        args = self.args
        args.database = "sqlite:///" + os.path.join('uptune.db', 
                                                    str(index) + \
                                                    '-' + str(stage) + '.db')
        interface = MeasurementInterface(args=args,
                                         manipulator=manipulator,
                                         project_name='tuning',
                                         program_name='tuning',
                                         program_version='0.1')
        api = TuningRunManager(interface, args)
        return api
  
  
    def global_report(self, stage, epoch, api, node, cfg, requestor, result, flag=False):
        """
        import (global) results into global db 
        """
        if result < self._best[stage] or self._best[stage] == None:
            self._best[stage] = result
            if stage == 0: self._cfg = cfg
            flag = True
  
        api.manipulator.normalize(cfg)
        hashv = api.manipulator.hash_config(cfg)
        g = GlobalResult(epoch = epoch, 
                         node  = node, 
                         data  = cfg,
                         hashv = hashv,
                         time  = datetime.now(),
                         technique = requestor,
                         result = result,
                         was_the_best = flag)  
        self._glbsession[stage].add(g)
        self._glbsession[stage].flush()
        self._glbsession[stage].commit()
  
  
    def synchronize(self, stage, api, node, epoch):
        """ 
        synchronize results between different bandits and trails 
        MAB arm in-memory history updates while importing happens
        """
        if epoch == 0: 
            pass
        q = GlobalResult.extract(self._glbsession[stage], node, epoch) 
        api.sync(q)
  
  
    def create_params(self, stage=0):
        """ 
        example of json: [type, name, range] 
        """
        manipulator = ConfigurationManipulator()
        for item in self._params[stage]:
            ptype, pname, prange = item
            if ptype == "IntegerParameter": 
                manipulator.add_parameter(IntegerParameter(pname, prange[0], prange[1]))
            if ptype == "EnumParameter": 
                manipulator.add_parameter(EnumParameter(pname, prange))
            if ptype == "FloatParameter": 
                manipulator.add_parameter(FloatParameter(pname, prange[0], prange[1]))
            if ptype == "LogIntegerParameter": 
                manipulator.add_parameter(LogIntegerParameter(pname, prange[0], prange[1]))
            if ptype == "PowerOfTwoParameter": 
                manipulator.add_parameter(PowerOfTwoParameter(pname, prange[0], prange[1]))
            if ptype == "BooleanParameter": 
                manipulator.add_parameter(BooleanParameter(pname))
        return manipulator
        
  
    def thread_pool_init(self, parallelism=1):
        if self.thread_pool is None:
            self.thread_pool = ThreadPool(2 * parallelism)
            self.thread_pool.map(int, list(range(2 * parallelism)))
          
  
    def call_program(self, cmd, limit=None, memory_limit=None):
        """
        replicates of MeasurementInterface call_program() 
        call programs (self.pids) with time limit 
        """
        kwargs = dict()
        self.thread_pool_init(self._parallel)

        subenv = os.environ.copy()
        subenv["ANALYSIS"] = "True"
        subenv["EZTUNING"] = "True"

        if limit is float('inf'):
            limit = None
        if type(cmd) in (str, str):
            kwargs['shell'] = True
            kwargs['env'] = subenv
        killed = False
        t0 = time.time()
        p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE,
                             preexec_fn=preexec_setpgid_setrlimit(memory_limit),
                             **kwargs)
        # Add p.pid to list of processes to kill in case of keyboardinterrupt
        self.pid_lock.acquire()
        self.pids.append(p.pid)
        self.pid_lock.release()
  
        try:
          stdout_result = self.thread_pool.apply_async(p.stdout.read)
          stderr_result = self.thread_pool.apply_async(p.stderr.read)
          while p.returncode is None:
            if limit is None:
              goodwait(p)
            elif limit and time.time() > t0 + limit:
              killed = True
              goodkillpg(p.pid)
              goodwait(p)
            else:
              # still waiting...
              sleep_for = limit - (time.time() - t0)
              if not stdout_result.ready():
                stdout_result.wait(sleep_for)
              elif not stderr_result.ready():
                stderr_result.wait(sleep_for)
              else:
                #TODO(jansel): replace this with a portable waitpid
                time.sleep(0.001)
            p.poll()
        except:
          if p.returncode is None:
            goodkillpg(p.pid)
          raise
        finally:
          # No longer need to kill p
          self.pid_lock.acquire()
          if p.pid in self.pids:
            self.pids.remove(p.pid)
          self.pid_lock.release()
  
        t1 = time.time()
        return {'time': float('inf') if killed else (t1 - t0),
                'timeout': killed,
                'returncode': p.returncode,
                'stdout': stdout_result.get(),
                'stderr': stderr_result.get()}
  
  
    def unique(self, api, stage, desired_result):
        """
        return a unique desired result 
        report result if duplicates
        """
        assert desired_result != None, "Invalid Desired Result"
        cfg = desired_result.configuration.data
        hashv = self.hash_cfg(api, desired_result)
  
        q = GlobalResult.get(self._glbsession[stage], hashv, cfg)
        if q == None:
            return True
        else:
            result = Result(time=q.result) 
            api.report_result(desired_result, result)
            return False
  
  
    def hash_cfg(self, api, desired_result):
        """ get the cfg hash of the dr passed in """
        cfg = desired_result.configuration.data
        api.manipulator.normalize(cfg)
        hashv = api.manipulator.hash_config(cfg)
        return hashv
  
  
    def training(self, model_list, stage=0):
        """ 
        initialize and train models with user-provided data if any 
        create mapping from Enum to int for model leanring
        """
        if len(model_list) > 0: 
            self._valid = True
  
            for item in self._params[stage]:
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
  
  
    def prune(self, api, stage, desired_result):
        """ 
        prune unpromising + duplicate proposals with learning models 
        generate a weighed score from the model ensemble
        """
        if self.unique(api, stage, desired_result) == True:
            if self._valid == True:  # use ML model pruning 
                assert len(self._models) > 0, "No model available"
                if self.multivoting(stage, desired_result) == True: return True
                else: return False 
            return True 
        return False
  
  
    def main(self, template=False):
        """
        coarse-grained tuning for python proragms 
        before_run() should be called to load params 
        """
        apis = [self.create_tuning(x, 0, self.create_params()) 
                    for x in range(self._parallel)]
  
        actors = [self.cls.remote(_, 0, self.args) 
                      for _ in range(self._parallel)]
  
        # user specified training data + models 
        self._models = self.training(self.args.learning_models) 
  
        start_time = time.time() 
        for epoch in range(self._limit):
            drs, cfgs = list(), list()
            for api in apis:
                desired_result = api.get_next_desired_result()
                if desired_result is None:
                    continue
  
                # prune and report back to opentuner database 
                while self.prune(api, 0, desired_result) == False:
                    log.warning("duplicate configuration request by %s from node %d", 
                        desired_result.requestor,
                        apis.index(api))
                    desired_result = api.get_next_desired_result()
  
                drs.append(desired_result)
                cfgs.append(desired_result.configuration.data)
            
            # assert and run in parallel with ray remote
            assert len(cfgs) == self._parallel, "All available cfgs have been explored"
            log.info('%s tuning across %d nodes. global_best is %f', 
                         str(datetime.now().strftime("%Y-%m-%d %H:%M:%S")),
                         self._parallel,
                         self._best[0] if self._best else float('inf'))

            if not template: # dtribute drs across nodes
                self.publish(drs, stage=0)

            objects = [actor.run.remote(drs[actors.index(actor)]) 
                          for actor in actors]

            # pool = ThreadPool(processes=self._parallel)
            # res = pool.apply_async(ray.get, (objects,))
            # qors = res.get()
            # if not template: # sort by node index 
            #     qors.sort(key=lambda x: x[0])

            qors = ray.get(objects)
            results = [Result(time=item[-1]) for item in qors]
  
            for api, dr, result in zip(apis, drs, results):
                api.report_result(dr, result)
                self.global_report(0, epoch, api,
                                   apis.index(api), 
                                   dr.configuration.data, 
                                   dr.requestor,
                                   result.time)
  
            for api in apis: # sync across nodes
                self.synchronize(0, api, apis.index(api), epoch)

            # time check and plot diagram
            elapsed_time = time.time() - start_time
            self._archive.append([elapsed_time, self._best[0]])
            with open('../archive.json', 'w') as fp:
                json.dump(self._archive, fp)
            if elapsed_time > float(self.args.timeout): 
                log.info('%s runtime exceeds timeout %ds. global_best is %f', 
                             str(datetime.now().strftime("%Y-%m-%d %H:%M:%S")),
                             int(elasped_time), self._best[0])
                break 
  
        for api in apis:
            api.finish()
        log.info('%s tuning complete. global_best is %f', 
                     str(datetime.now().strftime("%Y-%m-%d %H:%M:%S")),
                     self._best[0] if self._best else float('inf'))
      
        # save best cfg into json 
        with open('../uptune.json', 'w') as f:
            json.dump(self._cfg, f)
        log.info('%s tuning complete. best cfg save in uptune.json', 
                     str(datetime.now().strftime("%Y-%m-%d %H:%M:%S")))
        return self._cfg


    # ------------------------------------
    # fine-grained auto-tuning control 
    # ------------------------------------
    def set_actor_cls(self, actor):
        """ set actor cls from builder and tmpl """
        self.cls = actor


    def create_instances(self):
        """ create single-stage api controller, ray actors and ML model instances"""
        self._actors = [self.cls.remote(_, 0, self.args) 
                            for _ in range(self._parallel)]
        self._apis = [self.create_tuning(x, 0, self.create_params()) 
                          for x in range(self._parallel)]
        self._models = self.training(self.args.learning_models) 


    def finish_tuning(self):
        """ return best cfg """
        best_cfgs = [api.get_best_configuration() for api in self._apis]
        for api in self._apis:
            try: api.finish()
            except: pass
        return best_cfgs
        

    def generate_dr(self): 
        """ singe-stage generate desired result """
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
        assert len(drs) == self._parallel, \
               "All available cfgs have been explored"
        return drs, idxs 


    def rpt_and_sync(self, epoch, drs, results, mapping=None, stage=0):
        """ report and synchronize result """
        log.info('%s start tuning in parallel. global_best is %f', 
                     str(datetime.now().strftime("%Y-%m-%d %H:%M:%S")),
                     self._best[stage] if self._best is not None else float('inf'))

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
            self.synchronize(stage, api, 
                             self._apis.index(api), epoch)


class RunProgram(object):
    """
    Ray Actor to be called by object of ParallelTuning Class
    Extending dataflow from functional programming  
    Reference: https://ray.readthedocs.io/en/latest/actors.html
    """
    def __init__(self,
                 index, 
                 stage,
                 args=None):
        self.index       = index             
        self.stage       = stage
        self.args        = args
        self.workpath    = None
        self.pids        = []
        self.pid_lock    = threading.Lock()
        self.thread_pool = None 
        self.dumper      = JinjaParser() 

    def start_run(self, nodes=1):
        """
        called after run() starts
        """
        if nodes == 1: 
            self.workpath = str(self.index)
            os.rename(self.workpath, 
                      self.workpath + '-inuse')
            os.chdir(self.workpath + '-inuse')

        else: # find available folder 
            for folder in next(os.walk('.'))[1]:
                if folder.isdigit():
                    self.workpath = folder
                    os.rename(folder, folder + '-inuse')
                    os.chdir(folder + '-inuse')
                    break

        # fname = "res-" + str(self.stage) + ".json"
        # if os.path.isfile(fname):
        #     os.system('rm ' + fname)
        

    def end_run(self):
        """
        called before run() ends
        """
        os.chdir("../")
        os.rename(self.workpath + '-inuse', 
                  self.workpath)

    def thread_pool_init(self, parallelism=1):
        if self.thread_pool is None:
          self.thread_pool = ThreadPool(2 * parallelism)
          self.thread_pool.map(int, list(range(2 * parallelism)))

    def call_program(self, cmd, aws=False, sample=False, 
                     limit=None, memory_limit=None):
        """
        replicates of MeasurementInterface call_program() 
        call programs (self.pids) with time limit 
        """
        kwargs = dict()
        self.thread_pool_init(self.args.parallelism)

        subenv = os.environ.copy()
        subenv["EZTUNING"] = "True"
        subenv["INDEX"] = str(self.index)
        subenv["STAGE"] = str(self.stage)

        # early exit in multistage & aws
        if sample: subenv["SAMPLE"] = "True"
        if aws: subenv["AWS"] = "True"

        if limit is float('inf'):
            limit = None
        if type(cmd) in (str, str):
            kwargs['shell'] = True
            kwargs['env'] = subenv
        killed = False
        t0 = time.time()
        p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE,
                             preexec_fn=preexec_setpgid_setrlimit(memory_limit),
                             **kwargs)
        # Add p.pid to list of processes to kill in case of keyboardinterrupt
        self.pid_lock.acquire()
        self.pids.append(p.pid)
        self.pid_lock.release()

        try:
          stdout_result = self.thread_pool.apply_async(p.stdout.read)
          stderr_result = self.thread_pool.apply_async(p.stderr.read)
          while p.returncode is None:
            if limit is None:
              goodwait(p)
            elif limit and time.time() > t0 + limit:
              killed = True
              goodkillpg(p.pid)
              goodwait(p)
            else:
              # still waiting...
              sleep_for = limit - (time.time() - t0)
              if not stdout_result.ready():
                stdout_result.wait(sleep_for)
              elif not stderr_result.ready():
                stderr_result.wait(sleep_for)
              else:
                #TODO(jansel): replace this with a portable waitpid
                time.sleep(0.001)
            p.poll()
        except:
          if p.returncode is None:
            goodkillpg(p.pid)
          raise
        finally:
          # No longer need to kill p
          self.pid_lock.acquire()
          if p.pid in self.pids:
            self.pids.remove(p.pid)
          self.pid_lock.release()

        t1 = time.time()
        return {'time': float('inf') if killed else (t1 - t0),
                'timeout': killed,
                'returncode': p.returncode,
                'stdout': stdout_result.get(),
                'stderr': stderr_result.get()}

    def run(self, dr):
        """
        Main function to be parallelized provided by code generation 
        """
        raise RuntimeError("ParallelTuning.run() not implemented")
    

# -----------------------------
# Expr for Functional Module Reuse
# -----------------------------
class ProgramTune(ParallelTuning):
    """ 
    Uptune auto-generate test class
    get child class inherited from RunProgram class
    run RunProgram.run() in parallel and return feedback
    """
    def __init__(self, cls, args, *pargs, **kwargs):
        super(ProgramTune, self).__init__(cls, args, *pargs, **kwargs)
        self.before_run()


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
  
