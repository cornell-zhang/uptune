import uptune as ut

a = 'a' # {% a = TuneEnum('a', ['a', 'b', 'c', 'd', 'e', 'f', 'g']) %} 
b = 'c' # {% b = TuneEnum('c', ['a', 'b', 'c', 'd', 'e', 'f', 'g']) %} 

val = ut.target(hash(a) - hash(b))
