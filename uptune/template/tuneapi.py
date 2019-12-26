#/usr/bin/env python
import os, sys, psutil, subprocess
import uptune as ut
from uptune import config
from uptune.template import types 
from uptune.tuners import bandit
from inspect import signature as sig
import tvm

def start():
    """Restarts the current program, with file objects and descriptors
       cleanup
    """
    if os.getenv("UPTUNE"):
        del os.environ["UPTUNE"]
        try: # free handlers 
            p = psutil.Process(os.getpid())
            for handler in p.open_files() + p.connections():
                os.close(handler.fd)
        except Exception as e:
            sys.exit("cannot free handlers from the memory")
        # invoke uptune 
        python = sys.executable
        args = sys.argv
        args.insert(0, sys.argv[0])
        for k, v in ut.config.items():
            args.append("--" + k)
            args.append(str(v))
        p = subprocess.Popen("which uptune", 
            stdout=subprocess.PIPE, shell=True)
        exe = p.communicate()[0].rstrip().decode("utf-8")
        os.execv(exe, args)
    else: # tuning barrier
        sys.exit(0)

def tune(default=None, 
         tuning_range=(), 
         args=None, 
         name=None, 
         tuner=None):
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
    if default == None: # start tuning
        assert tuner, "not specify tuner"
        start(); return 

    if name: # checke name validity 
        import uptune as ut
        assert name not in ut.mapping.keys(), \
               "invalid name for registeration" 

    if isinstance(tuning_range, (list, tvm.container.Array)):
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

    # create permutation or boolean param
    assert len(tuning_range) == 0 and \
           isinstance(default, (bool, list)), \
           "for boolean or permutation range should be ()"
    if isinstance(default, bool):
        return types.TuneBool(default, name=name).val
    else: # create permutation param
        return types.TunePermutation(default, name=name).val

def tune_at(default, 
            tuning_range, 
            path, name):
    """
    replace the holder for tuning non-python vars 
    """
    # check local file 
    assert os.path.isfile(path), "file not exist"
    val = tune(default, 
               tuning_range, 
               name=name)
    with open(path, 'r+') as fp:
        txt = fp.read().replace(name, val)
        fp.seek(0)
        fp.truncate()
        fp.write(txt)

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
    
    
