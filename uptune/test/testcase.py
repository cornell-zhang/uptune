# -----------------------------------------
# Expr: the test cases will be parsed into 
#       Jinja template and be used for 
#       proposal cfg assignment in auto-tuning
# -----------------------------------------
import uptune

# test function 
def test(a, b, c, d=5):
    print a, b, c, d

@uptune.save('min')
def parse(val):
    return 2 * val

# ------------------------------------
# 1. annotation following declaration 
# ------------------------------------

a = 3 # {% a=TuneInt(1, (2, 8), 'xxx') %}
b = 7; c = 9 # {% b=TuneFloat(1, (0.2, 9)) c=TuneFloat(1, (0.2, 9)) %}
d = 9 # {% d=TuneFloat(1, (0.2, 9)) q=TuneEnum(9, [3, 6, 9]) %}
q = 8


# -------------------------------------
# 2. annotation preceding the declaration 
# -------------------------------------

# {% d = TuneBool(True,()) %}
d = True
test(a, b, c, d)
#  a=TuneInt(1, (2, 8)) cc=TuneInt(2, (9,3)) %} 
test(a=1, c=27, d=True, b=0)


# --------------------------------------
# 3. decorator for return value
# --------------------------------------
res = parse(a + b * q)  


# --------------------------------------
# 4. Corner cases + error detection
# --------------------------------------

e = 89        #  r=TuneXXX(1, (89, 100)) %}
k = 99        #  k= TuneInt(1, (99, 100))       MISSING {%        |
j = 99        #  j=TuneInt(99, 100) %}          WRONG SCOPE       | 
m = 99        #  m=TuneInt((99, 100)) %}        NO DEFAULT        | 
n = 99        #  n=TuneInt(2,(99, 100)) XXX %}  WRONG NAME        |
u = 26        #  n=TuneInt(2,(99, 100)) %}      DOUBLE ANNOTATION | DONE
w, v = 56, 33 #  v=TuneInt(1, (2, 9)) %}        MIXED DECLRATION  |



