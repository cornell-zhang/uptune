from uptune.tuners import bandit

try: # reuse autotvm builder & runner 
    from tvm import autotvm
    builder = autotvm.LocalBuilder(timeout=10)
    runner = autotvm.LocalRunner(number=20, repeat=3, timeout=4, min_repeat_ms=150)
except ImportError as e:
    builder = None
    runner = None
    
