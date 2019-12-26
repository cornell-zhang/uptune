import uptune as ut
from uptune.tuners import bandit 

def test_tuner_api():
    a = ut.tune(3, (1, 9), name="a") 
    tuner = ut.tuner.xgboost()
    res = ut.target(a*2)

def test_constraints():
    ut.init() # init env variable
    a = ut.tune(3, (1, 9), name="a") 
    b = ut.tune(5, (2, 7), name="b") 
    # ut.constraint(ut.a < ut.b)
    res = ut.target(a*2)
    # invoke python -m uptune.on program.py
    ut.config["test-limit"] = 2
    ut.tune(tuner=bandit(ut.config))

test_constraints()
# re-run the program and get currently best 
# print("best: ", ut.run_with_best())


