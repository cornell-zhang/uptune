import numpy as np
import re, os, sys, ray, json, boto3
import logging, threading, time
from datetime import datetime
from matplotlib import pyplot as plt
from multiprocessing.pool import ThreadPool
from uptune import globaldb
from uptune.api import ParallelTuning, RunProgram
from uptune.template.pipeline import device, distribute
# from uptune.template.pubsub import publisher
from uptune.opentuner.resultsdb.models import Result
from uptune.src.multistage import score, multirun

log = logging.getLogger(__name__)

# ---------------------------------------------------
# Controller and func builders for general tuning
# ---------------------------------------------------

class MpiController(ParallelTuning):
    """
    top-level controller with copying file enabled 
    """
    def __init__(self, cls, args, *pargs, **kwargs): 
        super(MpiController, self).__init__(cls, args, *pargs, **kwargs)
        self.device_pool = list()

    def analysis(self, cmd):
        """ run the default program and extract cfg """
        # analysis finished in built-in api mode
        if os.path.isfile('params.json'):
            return

        entry = cmd.split()[0]
        if re.search(r'.*?\.py', entry):
            cmd = 'python ' + cmd
    
        result = self.call_program(cmd)
        assert result['returncode'] == 0, \
               "given command cannot run thru: " + \
               result['stderr'].decode('utf-8')
        assert os.path.isfile('params.json'), \
               'params.json not found in current path'


    def add_devices(self, stage):
        """ start zeromq device queue """
        for s in range(stage):
            front, end = 5559 + 2 * s, 5560 + 2 * s
            thread = threading.Thread(target=device, args=(front, end))
            thread.daemon = True                          
            thread.start()                                
            self.device_pool.append(thread)


    def init_dbs(self, stage):
        """ start zeromq device queue """
        for _ in range(stage):
            engine, Session = globaldb.globalconnect(self.args.database + str(_) + '.db')
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

        # --------------------------
        # launch stage-wise tuning  
        # --------------------------
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
  
        # ----------------------------------------
        # the user specifies the training data + models 
        # ----------------------------------------
        self._models = self.training(self.args.learning_models) 
  
        start_time = time.time() 
        for epoch in range(self._limit):
            drs, cfgs = list(), list()
            for api in apis:
                desired_result = api.get_next_desired_result()
                if desired_result is None:
                    continue
  
                # ---------------------------------------------
                # prune/skip/report back 
                # ---------------------------------------------
                while self.prune(api, desired_result) == False:
                    log.warning("duplicate configuration request by %s from node %d", 
                        desired_result.requestor,
                        apis.index(api))
                    desired_result = api.get_next_desired_result()
  
                drs.append(desired_result)
                cfgs.append(desired_result.configuration.data)
            
            # ------------------------------------------
            # start client run in parallel with ray remote
            # ------------------------------------------
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


    def publish(self, drs, stage, aws=False):
        """
        publish drs into __cfg__
        """
        cfgs = [d.configuration.data for d in drs]
        # distribute(cfgs, stage)

        if not aws: 
            base = '__cfg__/{}-{}.json' 
            for idx in range(len(cfgs)):
                fname = base.format(stage, idx)
                with open(fname, 'w') as fp:
                    json.dump(cfgs[idx], fp)
                fp.close()

        else: # upload cfg to aws s3 ins
            s3resource = boto3.resource('s3')
            bucket_name = "uptune-aws-s3-008594ab-381e-4b67-826b-a56f4dc6c03f"
            bucket = s3resource.Bucket(bucket_name)
            base = '{}-{}.json' 
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
    """ return different run() based on mode"""
    if tpl and mode == "decouple": 
        sys.exit("decouple mode invalid in template tuning")

    if mode == "single": 
        from uptune.src.singlestage import single_run_builder 
        return single_run_builder(cmd, timeout)

    # template / intrusive 
    elif mode == "multi":
        from uptune.src.multistage import multi_run_builder 
        return multi_run_builder(cmd, timeout)

    # intrusive tuning
    elif mode == "decouple": 
        return decouple_run_builder(cmd, timeout)


def decouple_run_builder(cmd, timeout):
    """
    build ray actor run() with subprocess 
    """
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
    """
    build parse() for qor extraction from res-stage.json
    """
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


def mpisystem(args, command):
    """ return controller running main() """
    pt = MpiController(None, args)

    # set up cls from run_builder
    class SingleProcess(RunProgram):
        """ ray actor """
        def run(self, dr):
            raise RuntimeError('run() not implemented')
            
        def parse(self):
            raise RuntimeError('parse() not implemented')

    # recover or analyze
    print('[     0s]    INFO uptune.src: program profiling started')
    pt.analysis(command)
    with open('params.json', 'r') as fp:
       stage = len(json.load(fp)) 
       mode = "decouple" if stage > 1 else "single"
    fp.close()

    if os.path.isfile('feats.json'):
        mode = "multi" 
        assert stage == 1, \
               "can only support decouple or multi-stage" 
        
    # init controller 
    pt.init_dbs(stage)
    tpl = True if os.path.isfile('template.tpl') else False
    if not tpl: os.mkdir('__uptune__/__cfg__')

    # set the runtime limit for cmd
    cmd_timeout = args.runtime_limit
    setattr(SingleProcess, 'run', 
            run_builder(command, tpl, 
                        mode, cmd_timeout))
    # setattr(SingleProcess, 'parse', 
    #         parse_builder(tpl, mode))

    actor_cls = ray.remote(num_gpus=args.gpu_num,
                           num_cpus=args.cpu_num)(SingleProcess)
    pt.set_actor_cls(actor_cls)
    pt.before_run(copy=True)

    return pt, mode, tpl
