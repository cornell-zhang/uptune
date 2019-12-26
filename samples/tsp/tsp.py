#!/usr/bin/env python
#
# test case - permutation parameter
#
import uptune as ut

dataset = ["p01_d.txt", "att48_d.txt","p01_s.txt"]
data = "data/" + dataset[0]
m = open(data).readlines()
distance = [[int(i) for i in l.split()] for l in m]

def eval(p):
    return sum(distance[p[i]][p[i+1]] for i in range(len(p)-1))

default = list(range(len(distance)))
p = ut.tune(default, name="perm")

# return the distance
ret = ut.target(eval(p))
