#!/usr/bin/env python
import os, sys 
from sympy import Symbol
from sympy.core.relational import Relational
from uptune.template import types
from uptune.add import constraint as shared

class VarNode(Symbol):
    """
    VarNode for Constraint Net
    override ops for constraint record 
    """
    nodes = dict()
    constraint = []

    def __new__(cls, name, *args):
        return super(VarNode, cls).__new__(cls, name)

    def __init__(self, name, lower, upper):
        super(VarNode, self).__init__()
        self.name  = name
        self.lower = lower
        self.upper = lower

def register(name, lower, upper):
    """ 
    register node with constraint
    """
    assert isinstance(lower, (float, int, VarNode)), \
           "invalid lower bound type"
    assert isinstance(upper, (float, int, VarNode)), \
           "invalid upper bound type"
    shared.VarNode.nodes[name] = VarNode(name, lower, upper) 
           

def constraint(*args):
    """
    add constrains to search engine.
    information collected in analysis mode
    --------------
    Parameters:
        args: exprs on vars 
    """
    if os.getenv("ANALYSIS"): 
        for arg in args:
            assert isinstance(arg, Relational), \
                   "invalid constraint type" + str(type(arg))
            shared.VarNode.constraint.append(arg)

if __name__ == "__main__":
    import uptune as ut
    register('a', 0, 3)
    register('b', 2, ut.a)
    register('c', 2.0, 9.7)
    print(type(ut.a))
    print(shared.VarNode.nodes)
    ut.constraint(ut.a * ut.a <= ut.b * ut.b, 
                  ut.a + ut.c >= 7.5) 
