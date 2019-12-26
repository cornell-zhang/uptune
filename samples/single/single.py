import uptune as ut

pool = ['a', 'b', 'c', 'd', 
        'e', 'f', 'g', 'h',
        'i', 'j', 'k', 'm']
a = ut.tune('a', pool)
b = ut.tune('c', pool)
c = ut.tune(0.2, (1.0, 9.0), name="c")
d = ut.tune(2, (1, 9), name="d")

print(type(ut.c), type(ut.d))
ut.constraint(ut.c * ut.d < 9)
val = ut.target(c * hash(a) - \
                d * hash(b))
