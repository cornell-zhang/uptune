#!/usr/bin/env python
import os, sys 
from uptune.template import types
from pulp import LpVariable 

class VarNode(LpVariable):
    """
    Var Node for Constraint Net
    """
    nodes = dict()
    constraint = []
    def __init__(self, name, lower, upper):
        super(VarNode, self).__init__(name, lower, upper)

    @classmethod
    def reg(cls, name, lower, upper):
        """ 
        register node with constraint
        """
        assert isinstance(lower, (float, int, VarNode)), \
               "invalid lower bound type"
        assert isinstance(upper, (float, int, VarNode)), \
               "invalid upper bound type"
        assert name not in VarNode.nodes.keys(), \
               "duplicate name defined"
        VarNode.nodes[name] = cls(name, lower, upper) 
           

def constraint(*args):
    """
    Add constrains to search engine.
    --------------
    Parameters:
        args: exprs on vars 
    """
    for i in range(len(args)):
        print(args[i])
    

if __name__ == "__main__":
    import uptune as ut
    from uptune.add import constraint as shared
    shared.VarNode.reg('a', 0, 3)
    print(type(ut.a))
    shared.VarNode.reg('b', 2, ut.a)
    shared.VarNode.reg('c', 2.0, 9.7)
    print(shared.VarNode.nodes)
    ut.constraint(ut.a <= ut.b, 
                  ut.a + ut.c >= 7.5) 
