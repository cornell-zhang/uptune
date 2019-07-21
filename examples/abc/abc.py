from uptune import autotune, feedback
import random
import subprocess
import re

#resub -K 6 -l 2

abc_opt_pool = ['balance', 'rewrite', 'resub', 'refactor', 'rewrite -z', 'refactor -z']
syn_all = []
for i in range(0,24):
    at = autotune(abc_opt_pool[random.randint(0,5)], abc_opt_pool)
    at2 = autotune(6, [6,8,10,12])
    if at == 'resub':
        at += ' -K ' + str(at2)
    syn_all.append(at)

def abc_synthesis_flow():
    command = "abc -c \"read i10.aig;"
    for at in syn_all:
        command += at+";"
    command +="if -K 6;print_stats\" > abc_if_res.log"
    return command

print(abc_synthesis_flow())
process = subprocess.Popen(abc_synthesis_flow(), shell=True)
process.wait()
def res():
    with open("abc_if_res.log", 'rb') as f:
        l = f.readlines()[-1]
    f.close()
    print(str(l))
    x = re.findall("\d+", str(l))
    return int(x[9]), int(x[-1]) # lut count, depth


val = feedback(res()[0])
