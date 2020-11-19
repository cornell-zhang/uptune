import pandas as pd
import numpy as np
import sys, time, os, re, logging
from importlib import import_module

instances = list()
log = logging.getLogger(__name__)

class ModelBase(object):
    """
    Base Class for Learning Models (as plugins) 
    """
    def __init__(self,
                 name,
                 interval=10,
                 args=None):
        self.name     = name
        self.data     = None        # offline training data
        self.model    = None        # model object
        self.interval = interval    # online training interval
        self.valids   = list()      # new data points pending 
        self.count    = 0           # loop counter
        self.mapping  = dict()      # mapping from enum to int
        
    def createmap(self, mapping):    
        """ initialize model and mapping """
        self.mapping = mapping

    def inference(self, sample):
        """ initialize model and pre-train """
        raise RuntimeError(self.name + ' inference() not implement')
        return 0.0

    def retrain(self, sample):
        """ model updation with new validations """
        raise RuntimeError(self.name + ' retrain() not implement')

    def cache(self, epoch, features, results):
        """ save new results to self.valids for retraining """ 
        array = np.array([ f + [r] for f, r in zip(features, results) if f])
        if len(array) > 0:
            self.valids = (
                np.concatenate((self.valids, array)) if len(self.valids) > 1 
                else array)
        else:
            print(features, results, "???")
            log.warning("no valid features/qors from validation")
  
    def clean(self):
        """ remove pending not-imported yet results """
        self.valids = []


def search_models(model_list, mapping): 
    """ search local path and return models in list """
    for f in sorted(os.listdir(os.path.dirname(__file__))):
        m = re.match(r'^(.*)[.]py$', f)
        if m and m.group(1) in model_list:
            import_module('uptune.plugins.'+m.group(1))
    for ins in instances:
        ins.createmap(mapping)
    return instances

def register_models(args):
    instances.append(args)

def ensemble(model_list, mapping):
    """ 
    return available trained model instances 
    """
    search_models(model_list, mapping)
    return instances

