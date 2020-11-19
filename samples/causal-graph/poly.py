import uptune as ut

x = ut.tune(2, (2, 15), name="x")
y = ut.tune(5, (2, 12), name="y")
a = ut.tune(2, (2, 15), name="a")
b = ut.tune(5, (2, 12), name="b")

# Expected causal graph
xy = x * y + x * x
ab = a * a + b * b + a * b

res = ab - xy
ut.feature(ab, "ab")
ut.feature(xy, "xy")

ut.target(res, "max")
