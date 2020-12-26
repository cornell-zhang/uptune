import uptune as ut
from uptune.tuners import bandit 

def test_constraints():

    ut.config["test-limit"] = 2
    @ut.rule(var="v3")
    def rule_v3(vars):
        if (vars.v1 < 5) and (vars.v2 > 5):
            return 
        
    v1 = ut.tune(3, (1, 9), name="v1") 
    v2 = ut.tune(5, (2, ut.vars.v1), name="v2") 
    v3 = ut.tune(5, (2, 7), name="v3") 

    # register co-variates
    ut.register()
    ut.target(v1 + v2 + v3 *2, "max")

    # Transfer control to shell
    ut.tune()

def test_query():
    ut.config["test-limit"] = 2 

    @ut.objective("max")
    def target(vars):
        return vars.qor

    v1 = ut.tune(3, (1, 9), name="v1") 
    v2 = ut.tune(5, (2, ut.vars.v1), name="v2") 
    v3 = ut.tune(5, (2, 7), name="v3") 

    ut.register(a*2, name="qor")

if __name__ == "__main__"
    test_constraints()
    # re-run the program and get currently best 
    # print("best: ", ut.run_with_best())


