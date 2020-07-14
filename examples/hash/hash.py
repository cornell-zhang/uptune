import uptune as ut

# define the design search space
chars = [chr(i) for i in range(97, 97 + 26)]

a = ut.tune('a', chars)
b = ut.tune('c', chars)

c = ut.tune(0.2, (1.0, 9.0), name="c")
d = ut.tune(2, (1, 9), name="d")

print(ut.c, type(ut.d))

ut.constraint(ut.c * ut.d < 9)
res = ut.target(c * hash(a) - d * hash(b))
