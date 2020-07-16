#!/usr/bin/env python
from __future__ import division
from __future__ import print_function
from builtins import map
from builtins import filter
from builtins import range
from past.utils import old_div
# import adddeps  # fix sys.path

import math
import argparse
import ast
import collections
import json
import logging
import os
import random
import re
import subprocess
import sys
from multiprocessing import Process
import time
import uptune as ut

log = logging.getLogger('nvcc-options')

argparser = argparse.ArgumentParser()
argparser.add_argument('source', help='source file to compile')
argparser.add_argument('--compile-template',
                       default='{cc} {source} -o {output} {flags}',
                       help='command to compile {source} into {output} with {flags}')
argparser.add_argument('--compile-limit', type=float, default=30,
                       help='kill nvcc if it runs more than {default} sec')
argparser.add_argument('--runtime-limit', type=float, default=30,
                       help='kill binary if it runs more than {default} sec')
argparser.add_argument('--scaler', type=int, default=4,
                       help='by what factor to try increasing parameters')
argparser.add_argument('--output', default='./tmp.bin',
                       help='temporary file for compiler to write to')
argparser.add_argument('--debug', action='store_true',
                       help='on nvcc errors try to find minimal set '
                            'of args to reproduce error')
argparser.add_argument('--force-killall', action='store_true',
                       help='killall cc1plus before each collection')
argparser.add_argument('--memory-limit', default=1024 ** 3, type=int,
                       help='memory limit for child process')
argparser.add_argument('--flags-histogram', action='store_true',
                       help='print out a histogram of flags')
argparser.add_argument('--flag-importance',
                       help='Test the importance of different flags from a '
                            'given json file.')

args = argparser.parse_args()
program_name = args.source

def execute_output(cmd, times=1):
    print("\n========================")
    print("CMD: " + cmd)
    p = subprocess.Popen(cmd, stdout=subprocess.PIPE, shell=True)
    out, err = p.communicate()
    return p.returncode, out.decode("utf-8"), err

# --------------------
# NVCC version
# --------------------
nvcc = "nvcc"
m = re.search(r'([0-9]+)[.]([0-9]+)[.]([0-9]+)', subprocess.check_output([
    nvcc, '--version']).decode('utf-8'))
nvcc_version = tuple(map(int, m.group(1, 2, 3)))

# --------------------
# Define NVCC tool options
# --------------------
# FLAGS  : NVLINK + NVCC + PTXAS
NVLINK_FLAGS = [ "nvlink:--preserve-relocs" ]
NVCC_FLAGS   = [ "nvcc:--no-align-double", "nvcc:--use_fast_math" ]
PTXAS_FLAGS  = [ ]

# PARAMS : NVCC_PARAMS, PTXAS_PARAMS
NVCC_PARAMS = { "nvcc:--gpu-architecture="        : [ "sm_30", "sm_35", "sm_50", "sm_60" ],
                "nvcc:--relocatable-device-code=" : [ "true", "false" ],
                "nvcc:--ftz="                     : [ "true", "false" ],
                "nvcc:--prec-div="                : [ "true", "false" ],
                "nvcc:--prec-sqrt="               : [ "true", "false" ] }

PTXAS_PARAMS = { "ptxas:--def-load-cache="                : [ "ca", "cg", "cv", "cs" ],
                 "ptxas:--opt-level="                     : [ "0", "1", "2", "3" ],
                 "ptxas:--fmad="                          : [ "true", "false" ],
                 "ptxas:--allow-expensive-optimizations=" : [ "true", "false" ],
                 "ptxas:--maxrregcount="                  : (16, 63) }

# Options target identifiers
GCC_NAME = "-Xcompiler "
PTXAS_NAME = "-Xptxas "
NVLINK_NAME = "-Xnvlink "

# --------------------
# Utils functions
# --------------------
def parse_flags(flag_list, target):
    cmd = ""
    for full_flag, value in flag_list:
        flag = full_flag.split(":")[1]
        if (value == "on"):
            cmd += " " + target + " " + flag + " "
        elif (value != "off"):
            cmd += " " + target + " " + flag + str(value) + " "
    return cmd

def make_command(cfg):
    compile_template = "{cc} -w -ccbin g++ {source} -o {output} " 
    cmd = compile_template.format(source=args.source, output=args.output, cc=nvcc)

    nvcc_flags   = [ (key, value) for key,value in cfg.items() if key.startswith("nvcc") ]
    ptxas_flags  = [ (key, value) for key,value in cfg.items() if key.startswith("ptxas") ]
    nvlink_flags = [ (key, value) for key,value in cfg.items() if key.startswith("nvlink") ]

    cmd += parse_flags(nvcc_flags, "")
    cmd += parse_flags(ptxas_flags, PTXAS_NAME)
    cmd += parse_flags(nvlink_flags, NVLINK_NAME)
    return cmd

def execute(cmd, times=1):
    p = subprocess.Popen(cmd, stdout=subprocess.PIPE, shell=True)
    out, err = p.communicate()
    return p.returncode

def run_with_flags(flags, cmd=None, run_args=None):
    # pre-compile with flags
    tmp_dir = './' 
    output_dir = '%s/%s' % (tmp_dir, args.output)
    if os.path.isfile(output_dir):
        os.system("rm {}".format(output_dir))

    if cmd is None:
        cmd = args.compile_template.format(source=args.source, output=output_dir,
                                           flags=' '.join(flags), cc=nvcc)
    print("\n========================")
    print("CMD: {}".format(cmd))

    p1 = Process(target=execute, args=(cmd, )) 
    p1.start()
    start = time.time()

    finished = False
    while time.time() - start <= args.compile_limit:
        if not p1.is_alive():
            finished = True
            break
        time.sleep(15)  
    p1.terminate()
    p1.join()

    if not finished:
        return float("inf") 

    # run pre-comnpiled with runtime_limit
    if run_args is not None:
        output_dir += run_args

    start = time.time()
    code = execute(output_dir)
    end = time.time() 
    return float(end - start) * 1000

def flags_mean_time(flags, trials=10):
    total = run_with_flags(flags)
    tmp_dir = './' 
    output_dir = '%s/%s' % (tmp_dir, args.output)
    for _ in range(trials):
        start = time.time()
        code = execute(output_dir)
        end = time.time() 
        total += float(end - start) * 1000
    return old_div(total, trials)

def run_baselines(run_args):
    print("baseline perfs -O0={}ms -O1={}ms -O2={}ms -O3={}ms".format(
           *[run_with_flags(['-Xptxas -O%d,-v' % i], run_args=run_args) for i in range(4)]))

# GEMM Benckmark (Dimension + Blocksize + Cache) 
run_args = " 1024 32 2"
# run_baselines(run_args)

# -----------------
# Run the autotuning 
# -----------------
options = dict()
for flag in NVCC_FLAGS + PTXAS_FLAGS + NVLINK_FLAGS:
    options[flag] = ut.tune('on', ['on', 'off'], name=flag)
    
params = {**PTXAS_PARAMS, **NVCC_PARAMS}
for param, space in params.items():
    options[param] = ut.tune(space[0], space, name=param)

cmd = make_command(options)

runtime = run_with_flags([], cmd, run_args)
print("Runtime {}".format(runtime))
ut.target(runtime, "min")
