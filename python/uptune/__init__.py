# -*- coding: utf-8 -*- 
import sys, os, logging
from types import ModuleType
from .add import constraint

log = logging.getLogger(__name__)
__version__ = "0.0.1.dev0"

# Lazy import
all_by_module = {
    "uptune.api": [
        "init", 
        "config",
        "get_best"
    ],
    "uptune.add.constraint": [
        "constraint",
        "register",
        "rule",
    ],
    "uptune.template.tuneapi": [
        "tune",
    ],
    "uptune.report": [
        "get_global_id",
        "get_local_id",
        "get_meta_data",
        "save",
        "target",
        "interm",
        "feature",
        "vhls",
        "quartus"
    ],
    "uptune.quickest": [
        "preprocess",
        "train",
        "test"
    ],
    "uptune.tuners.tuner": [
        "model",
    ],
}

default_settings = {
    "test-limit"      : 10,
    "runtime-limit"   : 7200,
    "parallel-factor" : 2,
    "gpu-num"         : 0,
    "cpu-num"         : 1,

    "learning-model"  : "xgbregressor",
    "training-data"   : "",
    "online-training" : 1,
}

# Overide the shared register var dict
class proxy_dict(object):
    def __init__(self, vars):
        self.vars = vars
    def __getattr__(self, key):
        assert key in self.vars
        return self.vars[key]

# objs to module name mapping
object_origins = {}
for module, items in all_by_module.items():
    for item in items:
        object_origins[item] = module

class module(ModuleType):
    """ import objects from the modules."""
    def __init__(self, name):
        super(module, self).__init__(name)
        self.mapping = object_origins
        self.settings = default_settings

    # The command line config has higher priority
    def config(self, settings):
        for k, v in settings.items():
            assert k in default_settings.keys(), \
                    "Invalid key \"{}\" found...".format(k)
            self.settings[k] = v

    def __getattr__(self, name):
        if name in object_origins:
            module = __import__(object_origins[name], None, None, [name])
            for extra_name in all_by_module[module.__name__]:
                setattr(self, extra_name, getattr(module, extra_name))
            return getattr(module, name)

        # return registered var node object
        elif name == "vars":
            return proxy_dict(constraint.VarNode.nodes)

        # ut.var returns 0 in default mode 
        ModuleType.__getattribute__(self, name)
        # try:
        #     ModuleType.__getattribute__(self, name)
        # except: 
        #     log.warning("[ INFO ] Trying to access {}".format(name))
        #     log.warning("[ INFO ] Skip returning symbolic variable handle in default mode...")
        #     return True

    def __dir__(self):
        """ extend dir content """
        result = list(new_module.__all__)
        result.extend(
            (
                "__file__",
                "__doc__",
                "__all__",
                "__docformat__",
                "__name__",
                "__path__",
                "__package__",
                "__version__",
            )
        )
        return result

    def argparsers(self):
        """
        return a list of ArguementParser to be used as parents to the user's
        """
        from . import api
        from . import opentuner
        return [
            opentuner.measurement.driver.argparser,
            opentuner.measurement.interface.argparser,
            opentuner.search.driver.argparser,
            opentuner.search.plugin.argparser,
            opentuner.search.technique.argparser,
            opentuner.tuningrunmain.argparser,
            api.argparser,
          ]
    
    
    def default_argparser(self):
        import argparse
        return argparse.ArgumentParser(parents=self.argparsers())

new_module = sys.modules["uptune"] = module("uptune")
new_module.__dict__.update(
    {
        "__file__": __file__,
        "__package__": "uptune",
        "__path__": __path__,
        "__doc__": __doc__,
        "__version__": __version__,
        "__all__": tuple(object_origins),
        "__docformat__": "restructuredtext en",
    }
)

