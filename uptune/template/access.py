import os, json

def request(index, stage):
    """ request cfg from controller """
    fname = "../__cfg__/{}-{}.json".format(stage, index)
    with open(fname, 'r')  as fp:
        cfg = json.load(fp)
    fp.close()
    return cfg 


def retrieve(source):
    """ retrieve best cfg from source stage """
    fname = "../__cfg__/{}-best.json".format(source)
    if not os.path.isfile(fname):
        fname = "../__cfg__/{}-0.json".format(source)
    with open(fname, 'r')  as fp:
        cfg = json.load(fp)
    fp.close()
    return cfg 
