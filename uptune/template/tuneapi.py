#/usr/bin/env python
import os, sys
from uptune.template import types 


def autotune(default, tuning_range):
    """ 
    wrapper for TuneInt/Enum/Float types
    pull from queue to generate proposals  
    """
    if isinstance(tuning_range, list):
        assert len(tuning_range) > 0, \
               "must specify the tuning range as list"
        assert default in tuning_range, \
               "default should be in list"
        return types.TuneEnum(default, tuning_range).val 

    assert isinstance(tuning_range, tuple), \
           "tuple range for boolean and numerical values"

    if len(tuning_range) == 2:
        lower, upper = tuning_range
        assert lower < upper, "range value error"
        if isinstance(lower, float) or isinstance(upper, float):
            return types.TuneFloat(default, tuning_range).val
        return types.TuneInt(default, tuning_range).val

    assert len(tuning_range) == 0 and isinstance(default, bool), \
           "for boolean range should be ()"
    return types.TuneBool(default).val

    
if __name__ == "__main__":
    os.environ["EZTUNING"] = "ON"
    # os.environ["ANALYSIS"] = "ON"
    a = autotune(2, (6, 8))
    b = autotune(2, (7, 8))
    c = autotune(2, (7, 8))
    print(types.TuneBase.names)

    from uptune import feedback
    res = feedback(2 *a + b)
    print(res)
    
    
