from uptune import autotune, feedback

pool = ['a', 'b', 'c', 'd', 'e', 'f', 'g']
a = 'a' # {% a = TuneEnum('a', ['a', 'b', 'c', 'd', 'e', 'f', 'g']) %} 
b = 'c' # {% b = TuneEnum('c', ['a', 'b', 'c', 'd', 'e', 'f', 'g']) %} 

val = feedback(hash(a) - hash(b))
