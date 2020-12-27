import uptune as ut
from uptune.tuners import bandit 
import random

def test_constraints():
    
    # limit the search space
    @ut.rule(name="remove_outlier")
    def rule(vars):
        if (vars.v1 < 5) and (vars.v2 > 5):
            vars.v3 = 10
        
    v1 = ut.tune(3, (1, 9), name="v1") 
    v2 = ut.tune(5, (2, ut.vars.v1), name="v2") 
    v3 = ut.tune(5, (2, 7), name="v3") 

    # register co-variates
    ut.register(random.randint(1, 10), name="temp")
    ut.target(v1 + v2 + v3 *2, "max")

if __name__ == "__main__":
    test_constraints()


