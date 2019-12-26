import uptune as ut
import random
import subprocess
import re

#resub -K 6 -l 2
aig_pth = "i10.aig"
abc_opt_pool = ['balance', 'rewrite', 'resub', 'refactor', 'rewrite -z', 'refactor -z']
syn_all = []
for i in range(0,24):
    ut_idx0 = ut.tune(0, (0, 5), name='int_range')
    at = abc_opt_pool[ut_idx0]
    at2 = ut.tune(6, [6,8,10,12])
    if at == 'resub':
        at += ' -K ' + str(at2)
    syn_all.append(at)

def abc_synthesis_flow(aig_pth="i10.aig"):
    command = "abc -c \"read %s;" %aig_pth
    for at in syn_all:
        command += at+";"
    command +="if -K 6;print_stats\" > abc_if_res.log"
    return command

print(abc_synthesis_flow()[:-16])
process = subprocess.Popen(abc_synthesis_flow(), shell=True)
process.wait()
def res():
    with open("abc_if_res.log", 'rb') as f:
        l = f.readlines()[-1]
    f.close()
    #print(str(l))
    x = re.findall("\d+", str(l))
    print("%s: #LUT = %d ; #LEV = %d" % (aig_pth, int(x[9]), int(x[-1])))
    return int(x[9]), int(x[-1]) # lut count, depth

val = ut.target(res()[0],objective='min')
