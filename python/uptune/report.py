#!/usr/bin/env python
import uptune as ut
import os, functools, json, sys 
from uptune.template import types
from uptune.add import constraint, features

# Get the global id of measurement
def get_global_id():
    if os.getenv("UT_TUNE_START"):
        assert os.getenv("UT_MEASURE_NUM")
        assert os.getenv("UT_CURR_INDEX")
        return int(os.getenv("UT_CURR_INDEX")) + int(os.getenv("UT_MEASURE_NUM"))

# Get index in a local thread group
def get_local_id():
    if os.getenv("UT_TUNE_START"):
        assert os.getenv("UT_CURR_INDEX")
        return int(os.getenv("UT_CURR_INDEX"))

# Get other meta-data
def get_meta_data(key):
    if os.getenv("UT_TUNE_START"):
        assert os.getenv(key)    
        return os.getenv(key)

def save(objective='min'):
    def decorator(function):
        @functools.wraps(function)
        def run(*args, **kwargs):
            res = function(*args, **kwargs)
            return target(res, objective)
        return run
    return decorator

# To register the tagret QoR in the tuning 
def target(val, objective="min", tuner=None):

    assert isinstance(val, (int, float)), \
           "The feedback must be of real-value data type"
    assert objective in ['max', 'min'], \
           "The objective should be either 'min' or 'max'"

    # Generate
    if os.getenv("UT_BEFORE_RUN_PROFILE"):
        update('ut-qor-default.json', [val, objective])

        # Generate JSON as params LUT for intrusive tuning
        # Clean up the params record after hitting the break-points
        if not os.path.isfile('template.tpl'):
            update('ut-tune-params.json', types.TuneBase.params)
            types.TuneBase.params = []

    elif os.getenv("UT_TUNE_START"): 
        # In template (non-intrusive) mode
        if len(types.TuneBase.params) == 0:    
            qor_log_file = "ut-qor-stage-0.json"
            update(qor_log_file, [-1, val, objective])

        # For multi-stage tuning, the ut.target API serves 
        # as break-points of the program
        else: 
            stage = int(os.getenv("UT_CURR_STAGE"))
            assert types.TuneBase.stage <= stage, \
                "The break-point is set in the wrong place. Expected stage {}".format(stage)

            if types.TuneBase.stage == stage:
                qor_log_file = "ut-qor-stage-{}.json".format(stage)
                update(qor_log_file, [types.TuneBase.index, val, objective])
                print("[ INFO ] program exits at stage {}. Update target QoR to {}".format(stage, val))
                sys.exit(0)

            # Increase the stage counter
            types.TuneBase.stage += 1
    

def interm(features, shape=None):
    if shape is not None:
        assert len(features) == shape, \
               "shape not match"

    # Create JSON file for features 
    if os.getenv("UT_BEFORE_RUN_PROFILE"):
        update('feats.json', [-1, features])

    else: 
        os.system('rm feats.json') 
        update('feats.json', [types.TuneBase.index, features])

        # Perform sampling in multi-stage tuning 
        # the ut.interm serves as the break-points
        if os.getenv("UT_MULTI_STAGE_SAMPLE"): 
            sys.exit(0)

    return features 

# Insert 
def update(fname, value):
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


# Extract the Vivado HLS report 
def vhls(path, target=None):
    import xmltodict
    from tabulate import tabulate
    if not os.path.isfile(path):
        raise RuntimeError("Cannot find {}, run csyn first".format(xml_file))

    with open(path, "r") as xml:
        profile = xmltodict.parse(xml.read())["profile"]

    res = {}
    res["HLS Version"]    = "Vivado HLS " + profile["ReportVersion"]["Version"]
    res["Product family"] = profile["UserAssignments"]["ProductFamily"]
    res["Target device"]  = profile["UserAssignments"]["Part"]

    clock_unit = profile["UserAssignments"]["unit"]
    res["Top Model Name"] = profile["UserAssignments"]["TopModelName"]
    res["Target CP"]      = profile["UserAssignments"]["TargetClockPeriod"] + " " + clock_unit
    res["Estimated CP"]   = profile["PerformanceEstimates"]["SummaryOfTimingAnalysis"]["EstimatedClockPeriod"] + " " + clock_unit
    res["Latency (cycles)"] = "Min {:<6}; ".format(profile["PerformanceEstimates"]["SummaryOfOverallLatency"]["Best-caseLatency"]) + \
                              "Max {:<6}".format(profile["PerformanceEstimates"]["SummaryOfOverallLatency"]["Worst-caseLatency"])
    res["Interval (cycles)"] = "Min {:<6}; ".format(profile["PerformanceEstimates"]["SummaryOfOverallLatency"]["Interval-min"]) + \
                               "Max {:<6}".format(profile["PerformanceEstimates"]["SummaryOfOverallLatency"]["Interval-max"])
    est_resources = profile["AreaEstimates"]["Resources"]
    avail_resources = profile["AreaEstimates"]["AvailableResources"]
    resources = {}
    for name in ["BRAM_18K", "DSP48E", "FF", "LUT"]:
        item = [est_resources[name], avail_resources[name]]
        item.append("{}%".format(round(int(item[0])/int(item[1])*100)))
        resources[name] = item.copy()
    res["Resources"] = tabulate([[key] + resources[key] for key in resources.keys()],
                                headers=["Type", "Used", "Total", "Util"],
                                colalign=("left","right","right","right"))
    lst = list(res.items())
    tablestr = tabulate(lst, tablefmt="psql").split("\n")
    endash = tablestr[0].split("+")
    splitline = "+" + endash[1] + "+" + endash[2] + "+"
    tablestr.insert(5, splitline)
    table = '\n'.join(tablestr)
    print(table)
    return profile

def quartus(design, path, target=None):
    featVec = features.getQuartus(design,  path)
    # register the features in covars
    for k, v in featVec.items():
        if v == 'None': v = 0
        try: v = int(v)
        except: v = float(v)
        feature(v, k) 
    if target: # return sepcifc feature
        return featVec[target]
    else: # return feature vecture
        return featVec

def insert(fname, value):
    if not os.path.isfile(fname):
        json.dump({}, open(fname, 'w'))

    with open(fname, 'r+') as fp:
        value_deck = json.load(fp)
        fp.seek(0)
        fp.truncate()
        value_deck.update(value)
        json.dump(value_deck, fp)

def feature(val, name):
    # resgiter and save feture
    if os.getenv("ANALYSIS"):
        assert name not in ut.mapping.keys(), \
               "invalid name for registeration" 
        assert name not in types.TuneBase.names, \
               "invalid name for registeration" 
        constraint.register(name, val)
        # ut.__getattr__(name) = val
        insert('covars.json', {name : val})

    else: # dump result as feedback
        assert os.path.isfile('covars.json'), \
               "cannot find covars.json" 
        insert('covars.json', {name : val})

