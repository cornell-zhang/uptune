import os, json

def export_meta_data():
    # Check meta-data and export global info
    fname = "../configs/ut-meta-data.json"
    with open(fname, 'r')  as fp:
        meta_data = json.load(fp)
        for key, value in meta_data.items():
            os.environ[key] = str(value)

# Get the proposals from controller 
def request(index, stage):
    fname = "../configs/ut-dr-stage{}-index{}.json".format(stage, index)
    with open(fname, 'r')  as fp:
        config = json.load(fp)
    return config

# Retrieve best config from source stage
def retrieve(source):
    fname = "../configs/ut-stage{}-best.json".format(source)
    if not os.path.isfile(fname):
        fname = "../configs/ut-dr-stage{}-index0.json".format(source)
    with open(fname, 'r')  as fp:
        config = json.load(fp)
    return config
