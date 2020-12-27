import uptune as ut
from uptune.tuners import bandit 
import random

def test_query():

    # limit search result to satisfy certain conditions
    @ut.constraint(name="limit")
    def requirements(vars):
        conditions = [
            vars.temp > 2,
            var.v1 + vars.v3 < 5,
        ]
        return conditions

    v1 = ut.tune(3, (1, 9), name="v1") 
    v2 = ut.tune(5, (2, ut.vars.v1), name="v2") 
    v3 = ut.tune(5, (2, 7), name="v3") 

    a = random.randint(0, 10)
    ut.register(a*2, name="temp")
    ut.target(v1 + v2 - v3, "max")

if __name__ == "__main__":
    test_query()


