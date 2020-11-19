import time
import uptune as ut

a = ut.tune(1, (2, 109))
b = ut.tune(1, (3, 999))
c = ut.tune(1, (4, 239))
res = ut.target(2 * a + c)

time.sleep(10)

d = ut.tune(1, (5, 89))
e = ut.tune(1, (6, 909))
f = ut.tune(1, (2, 1299))
val = ut.target(2 * f + a)
