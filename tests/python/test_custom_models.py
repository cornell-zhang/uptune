import uptune as ut
from uptune.tuners import bandit 
import random

def test_custom_models():
    
    # define the search model in a decoupled way
    # the model can query the history and returns a proposal
    # use weight factor to balance from multiple search engines
    @ut.model(name="random", weight=0.5)
    def random_prop(vars, history):
        prop = dict()
        while True:
            for key, scope in vars.iterate():
                if key == "v1":
                    prop[key] = 1
                else:
                    prop[key] = scope.random()
            if not history.duplicate(prop):
                break
        return prop

    v1 = ut.tune(3, (1, 9), name="v1") 
    v2 = ut.tune(5, (2, ut.vars.v1), name="v2") 
    v3 = ut.tune(5, (2, 7), name="v3") 

    # register co-variates
    ut.register(random.randint(1, 10), name="temp")
    ut.target(v1 + v2 + v3 *2, "max")

if __name__ == "__main__":
    test_custom_models()


