#!/usr/bin/env python
import os, sys 
from sympy import Symbol
from sympy.core.relational import Relational

class Schedule(object):
    rules = []
    constraints = []
    custom_search_models = []

class VarNode(Symbol):
    """ VarNode to record the constraints symbolically """
    nodes = dict()
    constraint = []

    def __new__(cls, name, *args):
        return super(VarNode, cls).__new__(cls, name)

    def __init__(self, name, scope):
        super(VarNode, self).__init__()
        self.name  = name
        self.scope = scope
    
    def __str__(self):
        return "ut.VarNode(name={}, scope={})".\
            format(self.name, self.scope)     
    
    def __repr__(self):
        return "ut.VarNode(name={}, scope={})".\
            format(self.name, self.scope)

def register(var, name=None):
    """ Register node with constraint """
    # registering internal UtTune objects and user-input co-vars
    scope = None
    if name is None: name = var.name
    if isinstance(var, VarNode):
        scope = var.scope
    VarNode.nodes[name] = VarNode(name, scope)

# add user specific rules
def rule(name=None):
    def decorator(function):
        # TODO: statistically checking the legality
        def wrapper(*args, **kwargs):
            func(*args, **kwargs)
        Schedule.rules.append(wrapper)
        return wrapper
    return decorator

# add user specific qor constraints
def constraint(name):
    """ Record constrains between VarNodes """
    def decorator(function):
        # TODO: statistically checking the legality
        def wrapper(*args, **kwargs):
            func(*args, **kwargs)
        Schedule.constraints.append(wrapper)
        return wrapper
    return decorator

if __name__ == "__main__":
    import uptune as ut
    from uptune.add import constraint as shared
    register('a', 0, 3)
    register('b', 2, ut.a)
    register('c', 2.0, 9.7)
    print(type(ut.a))
    print(shared.VarNode.nodes)
