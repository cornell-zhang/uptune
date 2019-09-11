#!/usr/bin/env python
import os, functools, json, sys 
import xml.etree.ElementTree
from uptune.template import types
from uptune.add import constraint

def save(objective='min'):
    def decorator(function):
        @functools.wraps(function)
        def run(*args, **kwargs):
            res = function(*args, **kwargs)
            return target(res, objective)
        return run
    return decorator


def target(val, objective='min'):
    """ 
    return feedback for analysis and validation 
    results in sub-folder/res-stage.json returned by raylet
    """
    assert isinstance(val, (int, float)), \
           "the feedback must be of real-value data type"
    assert objective in ['max', 'min'], \
           "the objective can be either 'min' or 'max'"

    # generate params in analysis mode
    if os.getenv("ANALYSIS"):
        update('default.json', [val, objective])
        if not os.path.isfile('template.tpl'):
            update('params.json', types.TuneBase.params)
            types.TuneBase.params = []

    else: # dump result as feedback
        if len(types.TuneBase.params) == 0:    
            # template based tuning 
            update('res-0.json', [-1, val, objective])
        else: # intrusive tuning 
            stage = int(os.getenv("STAGE"))
            assert types.TuneBase.stage <= stage, 'wrong stage spec'
            if types.TuneBase.stage == stage:
                update('res-' + str(stage) + '.json', 
                       [types.TuneBase.index, val, objective])
                sys.exit(0)
            types.TuneBase.stage += 1
    return val
    

def interm(features, shape=None):
    """
    interm features for multi-stage
    """
    if shape:
        assert len(features) == shape, \
               "shape not match"

    if os.getenv("ANALYSIS") is not None:
        update('feats.json', [-1, features])
    else: # dump [index, guideline]
        os.system('rm feats.json') 
        update('feats.json', 
               [types.TuneBase.index, features])
        if os.getenv("SAMPLE"): sys.exit(0)
    return features 


def update(fname, value):
    """
    update result/params list for stages 
    """
    if not os.path.isfile(fname):
        f = open(fname, 'w') 
        json.dump([], f)
        f.close()

    with open(fname, 'r+') as fp:
        value_deck = json.load(fp)
        fp.seek(0)
        fp.truncate()
        value_deck.append(value)
        json.dump(value_deck, fp)
    fp.close()


def vhls(filename, target=None):
    """
    extract data from HLS report 
    """
    features = dict()
    e = xml.etree.ElementTree.parse(filename).getroot()
    for child in e.findall('./PerformanceEstimates/SummaryOfTimingAnalysis/'):
        if child.tag == 'EstimatedClockPeriod':
            features['timing'] = child.text
    for child in e.findall('./PerformanceEstimates/SummaryOfOverallLatency/'):
        if child.tag == 'Best-caseLatency':
            features['best'] = child.text
        if child.tag == 'Worst-caseLatency':
            features['worst'] = child.text
        if child.tag == 'Average-caseLatency':
            features['avg'] = child.text
    for child in e.findall('./AreaEstimates/Resources/'):
        if child.tag == 'BRAM_18K':
            features['bram'] = child.text
        if child.tag == 'DSP48E':
            features['dsp'] = child.text
        if child.tag == 'FF':
            features['ff'] = child.text
        if child.tag == 'LUT':
            features['lut'] = child.text

    if target: # return specific value
        assert target in features.keys(), \
        "target not in feature list"
        return features[target] 

    return features


