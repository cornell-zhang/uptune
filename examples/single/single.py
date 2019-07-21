from uptune import autotune, feedback

pool = ['a', 'b', 'c', 'd', 
        'e', 'f', 'g', 'h',
        'i', 'j', 'k', 'm']
a = autotune('a', pool)
b = autotune('c', pool)

val = feedback(hash(a) - hash(b))
