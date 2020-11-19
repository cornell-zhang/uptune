import uuid, os, copy, json
from builtins import object
# from uptune.template.pipeline import server
# from uptune.template.pubsub import subscriber
from uptune.add import constraint
from uptune.template.access import request, retrieve, export_meta_data
from uptune.src.codegen import (
    random_name, TPL_INT, TPL_ENUM, TPL_FLOAT,
    TPL_BOOL, TPL_PERM, TPL_LOG
)

class MetaInstanceRegistry(type):
    """Metaclass providing an instance registry """

    def __init__(cls, name, bases, attrs):
        """ create weakref for instance registry """
        super(MetaInstanceRegistry, cls).__init__(name, bases, attrs)
        cls._instances = list()

    def __call__(cls, *args, **kwargs):
        """ create instance (calls __init__ and __new__ methods) """
        inst = super(MetaInstanceRegistry, cls).__call__(*args, **kwargs)
        cls._instances.append(inst)
        return inst

    def _get_instances(cls, recursive=False):
        """
        get all instances of in the registry. return
        search subclasses recursively if recursive=True. 
        """
        instances = list(cls._instances)
        if recursive:
            for Child in cls.__subclasses__():
                instances += Child._get_instances(recursive=recursive)
        return list(set(instances))

    def _remove_instance(cls, instance):
        """ remove instance recursively """
        if instance in cls._get_instances():
            cls._instances.remove(instance)
        for Child in cls.__subclasses__():
            Child._remove_instance(instance)

class Registry(metaclass=MetaInstanceRegistry):
    pass

class TuneBase(Registry):
    """ Base class for Tune Class """
    stage, index, count = 0, -1, -1
    names, params, proposal = set(), list(), dict()
    def __init__(self, default, scope, name):
        self.value  = default 
        self.scope  = scope
        self.name   = name
        self.args   = None
        self.driver = None
        self.node   = None

    @property 
    def val(self):
        if os.getenv("UT_BEFORE_RUN_PROFILE"): 
            # Analyze params for enum, bool and permutation
            if isinstance(self.scope, list) or callable(self.scope): 
                if self.value == self.scope: 
                    tpl = TPL_PERM
                elif isinstance(self.value, bool): 
                    tpl = TPL_BOOL
                else: 
                    tpl = TPL_ENUM

                # Create a record for 
                token = copy.deepcopy(tpl)
                token[1] = random_name(TuneBase.names, self.name)
                if self.args: # scope = (lambda, args)
                    self.scope = (self.scope, self.args)
                token[2] = self.scope
                TuneBase.params.append(token)

            # infer and register numerical op
            else: 
                lb, ub = self.scope
                name = random_name(TuneBase.names, self.name)
                constraint.register(name, lb, ub)
                tpl = TPL_INT if isinstance(lb, int) and \
                                 isinstance(ub, int) else TPL_FLOAT
                token = copy.deepcopy(tpl)
                token[1] = name
                token[2] = self.scope
                TuneBase.params.append(token)
            return self.value

        # In tuning mode, pull the proposals back from
        # the log. 
        elif os.getenv("UT_TUNE_START"): 
            tune_params = "../ut-tune-params.json" 
            if TuneBase.count == -1: 
                assert os.path.isfile(tune_params), 'no params available'
                assert os.getenv("UT_CURR_STAGE"), 'no specified stage'
                assert os.getenv("UT_CURR_INDEX"), 'no specified index'
                stage = int(os.getenv("UT_CURR_STAGE"))
                TuneBase.index = int(os.getenv("UT_CURR_INDEX"))

                # deprecated: retrieving data from mpi channels 
                # TuneBase.index, TuneBase.proposal = server(stage)

                # Request configs from centralized controller
                if not os.getenv('UT_AWS_S3_BUCKET'):
                    TuneBase.proposal = request(TuneBase.index, stage)
                    export_meta_data()

                else: # load data from aws s3
                    import boto3
                    from botocore import UNSIGNED
                    from botocore.client import Config
                    
                    s3 = boto3.client('s3', config=Config(signature_version=UNSIGNED))
                    bucket_name = "uptune-aws-s3-008594ab-381e-4b67-826b-a56f4dc6c03f"
                    fname = "{}-{}.json".format(stage, TuneBase.index)
                    s3.download_file(bucket_name, fname, fname)
                    with open(fname, 'r') as fp:
                        TuneBase.proposal = json.load(fp)

                with open(tune_params, 'r') as fp:
                    params = json.load(fp)
                    TuneBase.params = params[stage]

                # For a multi-stage decoupled tuning process
                # load the best configutaion found in prev stage
                if stage > 0: 
                    for idx in reversed(range(0, stage)):
                        TuneBase.params = params[idx] + TuneBase.params
                        TuneBase.proposal.update(retrieve(idx))
                        # assert False, "%s" % str(TuneBase.params) + str(TuneBase.proposal) 
                          
            TuneBase.count += 1
            ptype, key, scope = TuneBase.params[TuneBase.count]
            return TuneBase.proposal[key]
        
        # default mode return
        else:
            return self.value

    def set_driver(self, driver):
        """
        link obj value to its driver for cfg assignment 
        """
        self.driver = driver

    def set_node(self, node):
        """
        identifier of nodes for Tune objects  
        """
        self.node = node


class TuneInt(TuneBase):
    def __init__(self, default, scope, name=None):
        super(TuneInt, self).__init__(default, scope, name)
        assert type(scope) == tuple, "tuple scope for TuneInt"
        assert len(scope) == 2, "tuple (lower, upper) for TuneInt"
        assert scope[0] < scope[1], "invalid scope range"
        assert all(isinstance(x, int) for x in scope), "only integer accepted"
        self.lower = int(scope[0])
        self.upper = int(scope[1])


class TuneEnum(TuneBase):
    def __init__(self, default, scope, args=None, name=None):
        super(TuneEnum, self).__init__(default, scope, name)
        assert type(scope) == list, "list scope for TuneEnum"
        assert len(scope) > 1, "at least one option in scope for TuneEnum"
        if args: self.args = args
        self.scope = scope


class TuneFloat(TuneBase):
    def __init__(self, default, scope, name=None):
        super(TuneFloat, self).__init__(default, scope, name)
        assert type(scope) == tuple, "tuple scope for TuneFloat"
        assert len(scope) == 2, "tuple (lower, upper) for TuneFloat"
        assert scope[0] < scope[1], "invalid scope range"
        self.lower = float(scope[0])
        self.upper = float(scope[1])


class TuneBool(TuneBase):
    def __init__(self, default, name=None):
        super(TuneBool, self).__init__(default, [True, False], name)
        assert isinstance(default, bool), "default must be boolean"


class TunePermutation(TuneBase):
    def __init__(self, default, name=None):
        super(TunePermutation, self).__init__(default, default, name)
        assert isinstance(default, list), "default must be list"


class TuneResult(object):
    def __init__(self, result, objective='minimize'):
        self.result = float(result)
        self.objective = objective
        assert objective in ['minimize', 'maximize'], "unrecognized objective"


if __name__ == '__main__':

    import uptune.template.types as shared
    os.environ["EZTUNING"] = "ON"
    os.environ["ANALYSIS"] = "ON"
    factor = shared.TuneInt(4,(3,5), 'xxx')
    factow = shared.TuneInt(6,(3,5)).val
    factoe = shared.TuneEnum(8,[3,5,89], 'xxxa').val
    factot = shared.TuneEnum(8,[5,9,7], 'xa').val

    for obj in TuneEnum._get_instances():
        obj.set_node(0)

    print(shared.TuneEnum._get_instances())
    print(shared.TuneInt._get_instances())
    print(shared.TuneBase._get_instances(recursive=True))

    shared.TuneBase._remove_instance(factor)
    print(shared.TuneBase._get_instances(recursive=True))
    print(TuneBase.params)

    # save result
    from uptune import target
    res = target(factoe * 2)
    print(res)



