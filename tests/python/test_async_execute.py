#!/usr/bin/python
import uptune as ut
import time

# Priority 
# 1. CLI passed-in args
# 2. Parameters set by ut.config
# 3. Default config params
settings = {
    "test-limit": 10000,
    "runtime-limit"   : 7200,
    "parallel-factor" : 2
    }
ut.config(settings)

# Ensure threads are executed async
# The task scheduler will dispatch the next available
# proposal to any free actor in the queue
def test_async_execution():
    bell = ut.tune(10, (0, 20))
    time.sleep(bell)
    ut.target(bell, "max")

if __name__ == "__main__":
    test_async_execution()
