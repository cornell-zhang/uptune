#/usr/bin/env python
import os, sys
from uptune.template import types 
from inspect import signature as sig

def tune(default, 
         tuning_range, 
         args=None, 
         name=None):
    """ 
    Return TuneInt/Enum/Float instantiated obj
    Property @val will return actual value 
    ----------
    Parameters: 
        default : value adopted in deafault mode
        tuning_range : dimensional search space 
        args : list of args for function
        name : identifier for var look-up
    ----------
    Return:
        value : string float or integer
    """
    if name: # checke name validity 
        import uptune as ut
        assert name not in ut.mapping.keys(), \
               "invalid name for registeration" 

    if isinstance(tuning_range, list):
        assert len(tuning_range) > 0, \
               "must specify the tuning range as list"
        assert default in tuning_range, \
               "default should be in list"
        return types.TuneEnum(default, 
                              tuning_range,
                              name=name).val 

    # custom func defining enum inter-deps
    elif callable(tuning_range):
        assert args, "args for function not specified"
        assert len(args) == len(sig(tuning_range).parameters), \
               "parameter number not match" 
        return types.TuneEnum(default, 
                              tuning_range,
                              args=args,
                              name=name).val 

    # create nodes for numerical ops
    assert isinstance(tuning_range, tuple), \
           "tuple range for boolean and numerical values"

    if len(tuning_range) == 2:
        lower, upper = tuning_range
        if isinstance(lower, float) or isinstance(upper, float):
            return types.TuneFloat(default, 
                                   tuning_range,
                                   name=name).val
        return types.TuneInt(default, 
                             tuning_range,
                             name=name).val

    assert len(tuning_range) == 0 and \
           isinstance(default, bool), \
           "for boolean range should be ()"
    return types.TuneBool(default, 
                          name=name).val

    
if __name__ == "__main__":
    os.environ["EZTUNING"] = "ON"
    # os.environ["ANALYSIS"] = "ON"
    a = tune(2, (6, 8))
    b = tune(2, (7, 8))
    c = tune(2, (7, 8))
    print(types.TuneBase.names)

    from uptune import target
    res = target(2 *a + b)
    print(res)
    
    
