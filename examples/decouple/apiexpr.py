import time
from uptune import autotune, feedback

a = autotune(1, (2, 109))
b = autotune(1, (3, 999))
c = autotune(1, (4, 239))
res = feedback(2 * a + c)
time.sleep(10)

d = autotune(1, (5, 89))
e = autotune(1, (6, 909))
f = autotune(1, (2, 1299))
val = feedback(2 * f + a)
