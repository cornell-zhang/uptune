from uptune import autotune, feedback
a = autotune(1, (2, 9))
b = autotune(1, (4, 9))
c = autotune(1, (2, 12))
d = autotune(1, (2, 9))
e = autotune(1, (2, 9))
f = autotune(1, (2, 9))
res = feedback(2 * a)
