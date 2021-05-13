import os, json

def export_meta_data():
    # Check meta-data and export global info
    fname = "../configs/ut.meta_data.json"
    with open(fname, 'r')  as fp:
        meta_data = json.load(fp)
        for key, value in meta_data.items():
            os.environ[key] = str(value)

# Get the proposals from controller 
def request(index, stage):
    fname = "../configs/ut.dr_stage{}_index{}.json".format(stage, index)
    with open(fname, 'r')  as fp:
        config = json.load(fp)
    return config

# Retrieve best config from source stage
def retrieve(source):
    fname = "../configs/ut.stage{}_best.json".format(source)
    if not os.path.isfile(fname):
        fname = "../configs/ut.dr_stage{}_index0.json".format(source)
    with open(fname, 'r')  as fp:
        config = json.load(fp)
    return config
