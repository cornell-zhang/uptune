import numpy as np
import re, os, sys, ray, json
import logging, threading, time
from datetime import datetime
from matplotlib import pyplot as plt
from multiprocessing.pool import ThreadPool
from uptune import database
from uptune.api import ParallelTuning, RunProgram
# from uptune.template.pipeline import device, distribute
# from uptune.template.pubsub import publisher
from uptune.opentuner.resultsdb.models import Result
from uptune.src.multi_stage import score, multirun

log = logging.getLogger(__name__)

class MpiController(ParallelTuning):
    def __init__(self, cls, args, *pargs, **kwargs): 
        super(MpiController, self).__init__(cls, args, *pargs, **kwargs)

    # Perform analysis before launching tuning tasks
    def analysis(self, cmd):
        if self.args.params_json != "":
            assert os.path.isfile(self.args.params_json)
            print("[ INFO ] Using given params JSON {}".format(self.args.params_json))
            for f in os.listdir("ut-work-dir"):
                rm_list = ""
                if not f.startswith("ut-"):
                    rm_list += " {}".format(f)
                os.system("cd ut-work-dir; rm -rf {}".format(rm_list))
            return True
        else:
            print("[ INFO ] Cleaning up the legacy work folder...")
            os.system("rm -rf ut-work-dir")

        # Run the program to extract search space
        entry = cmd.split()[0]
        if re.search(r'.*?\.py', entry):
            cmd = 'python ' + cmd
    
        result = self.call_program(cmd)
        assert result['returncode'] == 0, \
               "Input command \"{}\" failed. Error msg:\n{}".format(cmd, result['stderr'].decode('utf-8'))
        assert os.path.isfile("ut-tune-params.json"), \
               "{} not found in current path".format(params_record)
        self.args.params_json = "ut-tune-params.json"
        return False


    def init_dbs(self, stage):
        """ start zeromq device queue """
        for _ in range(stage):
            engine, Session = database.globalconnect(self.args.database + str(_) + '.db')
            self._glbsession.append(Session())
            self._best.append(float('inf'))

    def create_apis(self):
        """ create #stage by #parallel api matrix """
        self._stage = len(self._params)
        apis = [ [self.create_tuning(p, s, self.create_params(s)) 
                      for p in range(self._parallel)] 
                    for s in range(self._stage)]

        actors = [ [self.cls.remote(p, s, self.args) 
                        for p in range(self._parallel)]
                      for s in range(self._stage)]

        return apis, actors


    def select(self, stage, apis, cfgs):
        """ select proposals from db """
        # if pool._state == 0:
        #     pool.terminate()
        if self._cfg:
            return self._cfg
        return cfgs[0]
  

    def stage_dr_gen(self, apis, stage):
        """ generate dr pool for each stage """
        stage_drs, stage_cfgs = list(), list()
        for api in apis:
            desired_result = api.get_next_desired_result()
            if desired_result is None:
                continue
  
            # ---------------------------
            # prune / skip / report back 
            # ---------------------------
            while self.prune(api, stage, desired_result) == False:
                log.warning("duplicate cfg request by %s from node %d stage %d", 
                    desired_result.requestor,
                    apis.index(api),
                    stage)
                desired_result = api.get_next_desired_result()

            stage_drs.append(desired_result)
            stage_cfgs.append(desired_result.configuration.data)

        assert len(stage_cfgs) == self._parallel, \
               "All available cfgs have been explored"
        return stage_drs, stage_cfgs

  
    def stage_async(self, apis, actors, stage):
        """ running stage apis asyncly """
        bound = self._limit if stage else 10000 
        cross = stage < len(self._best) - 1
        # pubpool = ThreadPool(processes=self._parallel)

        for epoch in range(bound):
            drs, cfgs = self.stage_dr_gen(apis, stage)
            objects = [actor.run.remote(drs[actors.index(actor)]) 
                           for actor in actors]

            if cross:  # push cfg into stack
                cfg = self.select(stage, apis, cfgs)
                # pubpool = ThreadPool(processes=self._parallel)
                # [ pubpool.apply_async(publisher, (stage, _, cfg)) 
                #      for _ in range(self._parallel) ]
                base = '__cfg__/{}-best.json' 
                fname = base.format(stage)
                with open(fname, 'w') as fp:
                    json.dump(cfg, fp)
                fp.close()

            # # dtribute drs across nodes
            # pool = ThreadPool(processes=1)
            # res = pool.apply_async(ray.get, (objects,))
            # self.publish(drs, stage)
            # # return_vals is list of [index, qor] 
            # return_vals = sorted(res.get(), key=lambda x: x[0])

            self.publish(drs, stage)
            return_vals = ray.get(objects)
            results = [Result(time=item) for index, item in return_vals]

            for api, dr, result in zip(apis, drs, results):
                api.report_result(dr, result)
                self.global_report(stage,
                                   epoch, 
                                   api,
                                   apis.index(api), 
                                   dr.configuration.data, 
                                   dr.requestor,
                                   result.time)
  
            # sync node results 
            for api in apis:
                self.synchronize(stage, api, apis.index(api), epoch)
  

    def runtime(self, start_time):
        """ check program status and plotting """
        x = np.linspace(0, 50, 10)
        fig = plt.figure()
        ax1 = fig.add_subplot(2, 1, 1)
        ax2 = fig.add_subplot(2, 1, 2)
        fig.subplots_adjust(bottom = 0.1, 
                            top = 0.9,
                            hspace = 0.5)
        ax1.title.set_text('Accurarcy')
        ax2.title.set_text('Performance')

        fig.canvas.draw()    
        h1, = ax1.plot(x, linewidth=2)
        h2, = ax2.plot(x, linewidth=2)
        axbackground = fig.canvas.copy_from_bbox(ax1.bbox)
        ax2background = fig.canvas.copy_from_bbox(ax2.bbox)

        acctime, pertime = list(), list()
        accres, perres = list(), list()
        while time.time() - start_time < float(self.args.timeout): 
            acc, per = self._best
            time.sleep(10)
        
            # wait until any result available 
            while acc == float('inf') and per == float('inf'): 
                time.sleep(60)
                acc, per = self._best

            t = np.linspace(0, int(time.time() - start_time), 10)

            if acc != float('inf'):
                acctime.append(int(time.time() - start_time))
                accres.append( -1 * acc)
                h1.set_xdata(acctime)
                h1.set_ydata(accres)
                ax1.set_xlim([0, max(t)])
                ax1.set_ylim([1.1 * min(accres) - 0.1 * max(accres), 
                              1.1 * max(accres) - 0.1 * min(accres)])
                fig.canvas.restore_region(axbackground)
                ax1.draw_artist(h1)
                fig.canvas.blit(ax1.bbox)

            plt.pause(0.000000000001) 

            if per != float('inf'):
                pertime.append(int(time.time() - start_time))
                perres.append(per)
                h2.set_xdata(pertime)
                h2.set_ydata(perres)
                ax2.set_xlim([0, max(t)])
                ax2.set_ylim([1.1 * min(perres) - 0.1 * max(perres), 
                              1.1 * max(perres) - 0.1 * min(perres)])
                fig.canvas.restore_region(ax2background)
                ax2.draw_artist(h2)
                fig.canvas.blit(ax2.bbox)

            plt.pause(0.000000000001) 

            log.info('%s all-stage global_best: %s', 
                         str(datetime.now().strftime("%Y-%m-%d %H:%M:%S")),
                         str(self._best))
  

    def decouple(self):
        """ mpi-based multi-stage main function """
        apis, actors = self.create_apis()
        for stage in range(self._stage):
            self._models.append(self.training(self.args.learning_models)) 

        start_time = time.time() 
        pool = ThreadPool(processes=self._stage)

        # cross-stack debugging 
        # drs, cfgs = self.stage_dr_gen(apis[0], 0)
        # [ pool.apply_async(publisher, (0, _, cfgs[0])) for _ in range(2) ]
        # res = self.stage_async(apis[1], actors[1], 1)
        # print(res.get()); sys.exit()

        # Launch stage-wise tuning  
        for s in range(self._stage):
            args = (apis[s], actors[s], s) 
            res = pool.apply_async(self.stage_async, 
                                   args = args)

        self.runtime(start_time)

        for s in range(self._stage):
            for api in apis[s]:
                api.finish()
        return [api.get_best_configuration() for api in apis]


    def _main(self):
        """ mpi-based multi-stage main function """

        # instantiate api/actors and  
        apis = [self.create_tuning(x, self.create_params()) 
                    for x in range(self._parallel)]
  
        actors = [self.cls.remote(_, self.args) 
                      for _ in range(self._parallel)]
  
        # the user specifies the training data + models 
        self._models = self.training(self.args.learning_models) 
  
        start_time = time.time() 
        for epoch in range(self._limit):
            drs, cfgs = list(), list()
            for api in apis:
                desired_result = api.get_next_desired_result()
                if desired_result is None:
                    continue
  
                # prune/skip/report back 
                while self.prune(api, desired_result) == False:
                    log.warning("duplicate configuration request by %s from node %d", 
                        desired_result.requestor,
                        apis.index(api))
                    desired_result = api.get_next_desired_result()
  
                drs.append(desired_result)
                cfgs.append(desired_result.configuration.data)
            
            # Start client run in parallel with ray remote
            assert len(cfgs) == self._parallel, "All available cfgs have been explored"
            log.info('%s start tuning in parallel. global_best is %f', 
                         str(datetime.now().strftime("%Y-%m-%d %H:%M:%S")),
                         self._best if self._best is not None else float('inf'))

            objects = [actor.run.remote(drs[actors.index(actor)]) 
                           for actor in actors]

            pool = ThreadPool(processes=1)
            res = pool.apply_async(ray.get, (objects,))
            self.publish(drs)

            # return_vals is list of [index, qor] 
            return_vals = sorted(res.get(), key=lambda x: x[0])
            results = [Result(time=item) for index, item in return_vals]

            for api, dr, result in zip(apis, drs, results):
                api.report_result(dr, result)
                self.global_report(epoch, 
                                   api,
                                   apis.index(api), 
                                   dr.configuration.data, 
                                   dr.requestor,
                                   result.time)
  
            # -----------------------------------------
            # synchronize the result from all nodes
            # -----------------------------------------
            for api in apis:
                self.synchronize(api, apis.index(api), epoch)
            elapsed_time = time.time() - start_time
            if elapsed_time > float(self.args.timeout): 
                log.info('%s runtime exceeds timeout %ds. global_best is %f', 
                             str(datetime.now().strftime("%Y-%m-%d %H:%M:%S")),
                             int(elapsed_time), self._best)
                break 
  
        for api in apis:
            api.finish()
        return [api.get_best_configuration() for api in apis]


    def publish(self, drs, stage, meta=None, aws_s3_bucket=False):
        cfgs = [ d.configuration.data for d in drs ]
        # distribute(cfgs, stage)

        if not aws_s3_bucket: 
            # Pulish configs for each thread
            base = "configs/ut-dr-stage{}-index{}.json"
            for idx in range(len(cfgs)):
                fname = base.format(stage, idx)
                with open(fname, 'w') as fp:
                    json.dump(cfgs[idx], fp)
            # Publish meta-data
            if meta is not None:
                fname = "configs/ut-meta-data.json"
                with open(fname, 'w') as fp:
                    json.dump(meta, fp)

        # Upload tuning proposals to AWS S3 bucket
        else: 
            import boto3
            s3resource = boto3.resource('s3')
            bucket_name = "uptune-aws-s3-008594ab-381e-4b67-826b-a56f4dc6c03f"
            bucket = s3resource.Bucket(bucket_name)
            base = "ut-dr-stage{}-index{}.json"
            for idx in range(len(cfgs)):
                fname = base.format(stage, idx)
                with open(fname, 'w') as fp:
                    json.dump(cfgs[idx], fp)
                fp.close()
                bucket.upload_file(fname, fname, 
                                   ExtraArgs={'ACL':'public-read-write'})

MpiController.multirun = multirun
MpiController.score = score

def run_builder(cmd, tpl, mode, timeout):

    if tpl and mode == "decouple": 
        sys.exit("decouple mode invalid in template tuning")

    if mode == "single": 
        from uptune.src.single_stage import single_run_builder 
        return single_run_builder(cmd, timeout)

    # template / intrusive 
    elif mode == "multi-stage":
        from uptune.src.multi_stage import multi_run_builder 
        return multi_run_builder(cmd, timeout)

    # intrusive tuning
    elif mode == "decouple": 
        return decouple_run_builder(cmd, timeout)


def decouple_run_builder(cmd, timeout):
    entry = cmd.split()[0]
    if re.search(r'.*?\.py', entry):
        cmd = 'python ' + cmd
    
    # TODO: generate multifiles from tmpl
    filename = cmd.split()[1]

    def run(self, dr):
        self.start_run()
        
        # run the executable script with time limit
        result = self.call_program(cmd, limit=timeout)
        if result['returncode'] != 0: 
            log.warning("process collapsed with error on" + \
                        "node %d, return inf. error msg: %s", 
                        self.index, result['stderr'].decode('utf-8'))
            self.end_run()
            return float('inf')

        try: # parse result and return
            resfile = 'res-' + str(self.stage) + '.json'
            assert os.path.isfile(resfile), \
                   'res-stage.json not found in current path'

            # node specifier index
            with open(resfile, 'r') as fp:
                index, res, trend = json.load(fp)[-1]
            fp.close()
            if trend == 'max':
               res = (-1.0) * res
            pair = [index, res]

        except Exception as e:
            log.warning("parse data failure on \
                        ndoe %d, return inf. %s", self.index, e.message)
            self.end_run()
            return float('inf')

        index, qor = pair
        assert isinstance(qor, (int, float)), \
            'feedback function should return a real value'
        self.end_run()
        return pair

    return run


def decouple_parse_builder():
    def parse(self):
        resfile = 'res-' + str(self.stage) + '.json'
        assert os.path.isfile(resfile), \
               'res-stage.json not found in current path'
        # node specifier index
        with open(resfile, 'r') as fp:
            index, res, trend = json.load(fp)[-1]
        fp.close()
        if trend == 'max':
           res = (-1.0) * res
        return [index, res]  
    return parse


def create_task_scheduler(args, command):
    pt = MpiController(None, args)
    
    class SingleProcess(RunProgram):
        # Programmer executor
        def run(self, desired_result):
            raise RuntimeError('run() not implemented')

        # Parse th runtime output log to get QoR
        def parse(self):
            raise RuntimeError('parse() not implemented')

    # TODO: support namespace for dynamic search space
    # Each tuning var has its only scope. In this case, we
    # will have a search space tree
    # Example:
    # {top} - {v1, v2, ...}
    # left child - {top-if-01} - {vk, vk+1, ...}
    # right clild - {top-for-ik} - {vi, vi+1}
    
    # Check if the parameter has been generated before
    print('[ INFO ] Performing dynamic analysis...')
    reuse_params = pt.analysis(command)

    params_record = "ut-tune-params.json"
    params_config_dir = "ut-work-dir/configs"
    interm_features = "ut-interim-features.json"

    if reuse_params:
        params_record = os.path.join("ut-work-dir", params_record)
    with open(params_record, 'r') as fp:
        stage = len(json.load(fp)) 
        mode = "decouple" if stage > 1 else "single"

    # Checking only supports single stage for multi-stage
    if os.path.isfile(interm_features):
        mode = "multi-stage" 
        assert stage == 1, "can only support decouple or multi-stage" 
        
    # init controller 
    pt.init()
    pt.init_dbs(stage)

    use_template = True if os.path.isfile('template.tpl') else False
    if not use_template:
        os.mkdir(params_config_dir)

    # set the runtime limit for cmd
    cmd_timeout = args.runtime_limit

    setattr(SingleProcess, 'run', 
        run_builder(command, use_template, mode, cmd_timeout))
    # setattr(SingleProcess, 'parse', parse_builder(tpl, mode))

    actor_cls = ray.remote(num_gpus=args.gpu_num,
                           num_cpus=args.cpu_num)(SingleProcess)
    pt.set_actor_cls(actor_cls)

    # Create symbolic links for read-only files
    pt.before_run(copy=True)
    return pt, mode, use_template
