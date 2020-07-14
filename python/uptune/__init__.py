# -*- coding: utf-8 -*- 
import sys, os
from types import ModuleType
from .add import constraint
__version__ = "0.0.1.dev0"

all_by_module = {
    "uptune.api": ["init", "get_best"],
    "uptune.add.constraint": [
        "constraint",
    ],
    "uptune.template.tuneapi": [
        "tune",
    ],
    "uptune.get_result": [
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
}

default_settings = {
    "test-limit"      : 10,
    "runtime-limit"   : 7200,
    "parallel-factor" : 2,
    "learning-model"  : "xgbregressor",
    "gpu-num"         : 0,
    "cpu-num"         : 1,
}

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
        self.config = default_settings

    def __getattr__(self, name):
        if name in object_origins:
            module = __import__(object_origins[name], None, None, [name])
            for extra_name in all_by_module[module.__name__]:
                setattr(self, extra_name, getattr(module, extra_name))
            return getattr(module, name)

        # return registered var node object
        elif name in constraint.VarNode.nodes.keys():
            return constraint.VarNode.nodes[name] 

        # ut.var returns 0 in default mode 
        try: return ModuleType.__getattribute__(self, name)
        except: return True

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

