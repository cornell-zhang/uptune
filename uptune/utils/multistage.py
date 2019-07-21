import numpy as np
import sys, os, re, ray, json, random, logging
from itertools import cycle
from multiprocessing.pool import ThreadPool
from uptune.api import ParallelTuning, RunProgram
from uptune.opentuner.resultsdb.models import Result

log = logging.getLogger(__name__)


def score(self, features):
    """ return score from ML models"""
    assert len(self._models) > 0, 'No valid prediction model' 
    scores = list()
    for feature in features:
        # when feature list extraction fails
        if not feature:
           scores.append(-float('inf')) 
           continue
        item = list()
        for ins in self._models:
            item.append(ins.inference(feature)) 
        pred = [i for i in item if i]
        scores.append(float(sum(pred)/len(pred)))
    return scores 
    

def mab(self): 
    """ pure opentuner version """
    total, ratio = 10, 1
    for epoch in range(self._limit):

        drpool, idxpool = list(), list()
        while len(drpool) < total:
            drs, idxs = self.generate_dr() 
            drpool += drs
            idxpool += idxs

        drs = drpool
        mapping = dict([(drpool[idx], idxpool[idx]) 
                            for idx in range(total)])

        vals = ray.get([actor.run.remote(drs[self._actors.index(actor), 'post'])
                           for actor in self._actors])
        results = [Result(time=item) for item in vals]
        self.rpt_and_sync(epoch, drs, results, mapping)


    best_cfgs = self.finish_tuning()
    json.dump(best_cfgs, open('best_cfgs.json', 'w'))


def multirun(self, template=False): 
    """ instantiated multi-stage tuning main function """
    self.create_instances() # stage 0 as default

    # offline training with default ratio=0.25
    td = self.args.training_data
    if os.path.isfile(td): 
        for ins in self._models:
            ins.init(td)
    else: 
        log.warning('invalid traing data. \
                    start tuning without offline training')
    if self.args.offline:
        log.info('running on pure offline mode')

    # ---------------------------------------------
    # run trails 3*pf. randomly pick p from 1.5*pf
    # ---------------------------------------------
    total, ratio = 6, 0.5
    split = int(total * ratio * self._parallel)
    for epoch in range(self._limit):

        # ------------------------------------
        # generated pending-status dr
        # ------------------------------------          
        drpool, idxpool = list(), list()
        while len(drpool) < total * self._parallel:
            drs, idxs = self.generate_dr() 
            drpool += drs
            idxpool += idxs

        # ----------------------------------------
        #  generate features/scores into pool
        # ----------------------------------------
        scores, ftpool = list(), list() 
        for index in range(total):
            start = self._parallel * index
            end   = start + self._parallel
            drs = drpool[start : end]  

            if not template: # dtribute drs across nodes
                self.publish(drs, stage=0)
            objects = [actor.run.remote(drs[self._actors.index(actor)], 'pre')
                          for actor in self._actors]

            # deprecated: push cfgs into zmq
            # pool = ThreadPool(processes=self._parallel)
            # res = pool.apply_async(ray.get, (objects,))
            # if not template: # dtribute drs across nodes
            #     self.publish(drs, stage=0)
            # features = res.get()
            # if not template: # sort by node index  
            #     features = sorted(features, key=lambda x: x[0])

            features = ray.get(objects)
            features = [item[1] for item in features] 

            # save feats and scores
            scores += self.score(features)
            ftpool += features
        
        pairs = [(i, d, f, s) 
                     for i, d, f, s in zip(idxpool, drpool, ftpool, scores)]
        pairs.sort(key=lambda x: x[-1])
        array = np.array(pairs, dtype=[('index', int), 
                                       ('cfg', list),
                                       ('feature', list), 
                                       ('pred', float)])
        ranking = array # np.sort(array, order = 'pred')
        idx = random.sample(range(split, len(ranking)), self._parallel) 

        # --------------------------------------------
        # create drs/mapping to node api and validate
        # --------------------------------------------
        drs = [item[1] for item in ranking[idx]]
        fts = [item[2] for item in ranking[idx]]
        mapping = dict([(item[1], item[0]) 
                            for item in ranking[idx]])

        if not template: # distribute cfgs across node 
            self.publish(drs, stage = 0)
        objs = [actor.run.remote(drs[self._actors.index(actor)], 'post')
                   for actor in self._actors]

        # vals = pool.apply_async(ray.get, (objs,))
        # rets = vals.get()
        # if not template: # sort by node index 
        #     rets = sorted(rets, key=lambda x: x[0])

        rets = ray.get(objs)
        rets = [item[1] for item in rets] 

        results = [Result(time=item) for item in rets]
        self.rpt_and_sync(epoch, drs, results, mapping)
        qors = [obj.time for obj in results]

        # ----------------------------------------------
        # retrain models based on qor (default hybrid) 
        # ----------------------------------------------
        if not self.args.offline:
            for ins in self._models:
                ins.cache(epoch, fts, qors)
                if epoch % ins.interval == 0:
                    ins.retrain()

    best_cfgs = self.finish_tuning()
    json.dump(best_cfgs, open('best_cfgs.json', 'w'))
        

def multi_run_builder(cmd, timeout):
    """ 
    return guideline after the pre-pnr phase
    and qor after the validation phase
    """
    entry = cmd.split()[0]
    if re.search(r'.*?\.py', entry):
        cmd = 'python ' + cmd

    filename = cmd.split()[1]

    def run(self, dr, phase):
        """
        ret list() forguideline
        [node, val] for validation
        """
        self.start_run()
        if os.path.isfile('template.tpl'):
            self.dumper.codegen(self.index, dr, filename)

        if phase == "pre":
            exception_ret = None 
            res_fname = "feats.json"
            expected_type = list
            sample = True
        else: # validation phase
            exception_ret = float('inf') 
            res_fname = "res-0.json"
            expected_type = (int, float)
            sample = False
        
        result = self.call_program(cmd, 
                                   sample=sample,
                                   limit=timeout)
        if result['returncode'] != 0: 
            log.warning("run collapsed with error on \
                        node %d, error msg: %s", \
                        self.index, result['stderr'])
            self.end_run()
            return exception_ret

        try: # parse guideline / result and return
            with open(res_fname, 'r') as fp:
                # res = [node, val, trend] 
                # node always -1 for template
                res = json.load(fp)[-1]
                if phase == "post":
                    p = 1 if res[-1] == "min" else -1 
                    index = res[0]
                    res = p * res[1]
            fp.close()
                
        except Exception as e:
            log.warning("extraction failure on \
                        ndoe %d, return inf. %s", self.index, e.message)
            self.end_run()
            return exception_ret

        if not res: # invalid guideline /qor
            self.end_run()
            return exception_ret

        assert isinstance(res, expected_type), \
            'parser should return features as list/value'
        self.end_run()

        ret = [index, res] if phase == "post" else res 
        return ret

    return run

