#!/usr/bin/env python
import os, functools, json, sys 
import xml.etree.ElementTree
from uptune.template import types

# -------------------------------------
# function decorator to dump feedback 
# -------------------------------------
def save(objective='min'):
    def decorator(function):
        @functools.wraps(function)
        def run(*args, **kwargs):
            res = function(*args, **kwargs)
            assert isinstance(res, (int, float)), \
                   "the feedback must be of real-value data type"
            assert objective in ['max', 'min'], \
                   "the objective can be either 'min' or 'max'"
            with open('res-0.json', 'w') as fp:
                json.dump([res,objective], fp)
            fp.close()
            return res
        return run
    return decorator


def feedback(val, objective='min'):
    """ 
    return feedback for analysis and validation 
    results in sub-folder/res-stage.json returned by raylet
    """
    assert isinstance(val, (int, float)), \
           "the feedback must be of real-value data type"
    assert objective in ['max', 'min'], \
           "the objective can be either 'min' or 'max'"

    # generate params in analysis mode
    if os.getenv("ANALYSIS") is not None:
        update('default.json', [val, objective])
        if not os.path.isfile('template.tpl'):
            update('params.json', types.TuneBase.params)
            types.TuneBase.params = []
    else: # dump result as feedback
        if len(types.TuneBase.params) == 0:    
            # template based tuning 
            update('res-0.json', [-1, val, objective])
        else:                                  
            # intrusive tuning 
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


def vivado_hls(filename):
    """
    extract data from HLS report 
    """
    timing, best, avg, worst, bram, dsp, ff, lut = 0, 0, 0, 0, 0, 0, 0, 0
    e = xml.etree.ElementTree.parse(filename).getroot()
    for child in e.findall('./PerformanceEstimates/SummaryOfTimingAnalysis/'):
        if child.tag == 'EstimatedClockPeriod':
            timing = child.text
    for child in e.findall('./PerformanceEstimates/SummaryOfOverallLatency/'):
        if child.tag == 'Best-caseLatency':
            best = child.text
        if child.tag == 'Worst-caseLatency':
            worst = child.text
        if child.tag == 'Average-caseLatency':
            avg = child.text
    for child in e.findall('./AreaEstimates/Resources/'):
        if child.tag == 'BRAM_18K':
            bram = child.text
        if child.tag == 'DSP48E':
            dsp = child.text
        if child.tag == 'FF':
            ff = child.text
        if child.tag == 'LUT':
            lut = child.text

    metadata = [bram, dsp, ff, lut]
    return float(avg)


