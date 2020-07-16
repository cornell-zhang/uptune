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

FLAGS_WORKING_CACHE_FILE = 'cc_flags.json'
PARAMS_DEFAULTS_CACHE_FILE = 'cc_param_defaults.json'
PARAMS_DEF_PATH = 'gcc-4.8.5/params.def'
PARAMS_WORKING_CACHE_FILE = 'cc_params.json'

log = logging.getLogger('gccflags')

argparser = argparse.ArgumentParser()
argparser.add_argument('source', help='source file to compile')
argparser.add_argument('--compile-template',
                       default='{cc} {source} -o {output} -lpthread {flags}',
                       help='command to compile {source} into {output} with'
                            ' {flags}')
argparser.add_argument('--compile-limit', type=float, default=30,
                       help='kill gcc if it runs more than {default} sec')
argparser.add_argument('--runtime-limit', type=float, default=30,
                       help='kill binary if it runs more than {default} sec')
argparser.add_argument('--scaler', type=int, default=4,
                       help='by what factor to try increasing parameters')
argparser.add_argument('--cc', default='g++', help='g++ or gcc')
argparser.add_argument('--output', default='./tmp.bin',
                       help='temporary file for compiler to write to')
argparser.add_argument('--debug', action='store_true',
                       help='on gcc errors try to find minimal set '
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

def invert_gcc_flag(flag):
    assert flag[:2] == '-f'
    if flag[2:5] != 'no-':
        return '-fno-' + flag[2:]
    return '-f' + flag[5:]

def execute_output(cmd, times=1):
    print("CMD: " + cmd)
    p = subprocess.Popen(cmd, stdout=subprocess.PIPE, shell=True)
    out, err = p.communicate()
    return p.returncode, out.decode("utf-8"), err

def check_if_flag_works(flag, try_inverted=True):
    cmd = args.compile_template.format(source=args.source, output=args.output,
                                       flags=flag, cc=args.cc)
    code, output, err = execute_output(cmd)
    if code != 0:
        log.warning("removing flag %s because it results in compile error", flag)
        return False
    if 'warning: this target' in output:
        log.warning("removing flag %s because not supported by target", flag)
        return False
    if 'has been renamed' in output:
        log.warning("removing flag %s because renamed", flag)
        return False
    if try_inverted and flag[:2] == '-f':
        if not check_if_flag_works(invert_gcc_flag(flag), try_inverted=False):
            log.warning("Odd... %s works but %s does not", flag, invert_gcc_flag(flag))
            return False
    return True

# --------------------
# GCC version
# --------------------
m = re.search(r'([0-9]+)[.]([0-9]+)[.]([0-9]+)', subprocess.check_output([
    args.cc, '--version']).decode('utf-8'))
gcc_version = tuple(map(int, m.group(1, 2, 3)))

# --------------------
# Generate valid gcc flags
# --------------------
if os.path.isfile(FLAGS_WORKING_CACHE_FILE):
  # use cached version
  found_cc_flags = json.load(open(FLAGS_WORKING_CACHE_FILE))
else:
  # extract flags from --help=optimizers
  optimizers, err = subprocess.Popen([args.cc, '--help=optimizers'],
                                     stdout=subprocess.PIPE).communicate()
  found_cc_flags = re.findall(r'^  (-f[a-z0-9-]+) ', optimizers.decode('utf-8'), re.MULTILINE)
  log.info('Determining which of %s possible gcc flags work', len(found_cc_flags))
  found_cc_flags = list(filter(check_if_flag_works, found_cc_flags))
  json.dump(found_cc_flags, open(FLAGS_WORKING_CACHE_FILE, 'w'))

# --------------------
# Extract parameter defaults
# --------------------
param_defaults = dict()
if os.path.isfile(PARAMS_DEFAULTS_CACHE_FILE):
  # use cached version
  param_defaults = json.load(open(PARAMS_DEFAULTS_CACHE_FILE))
else:
  # default values of params need to be extracted from source code,
  # since they are not in --help
  param_defaults = dict()
  params_def = open(os.path.expanduser(PARAMS_DEF_PATH)).read()
  for m in re.finditer(r'DEFPARAM *\((([^")]|"[^"]*")*)\)', params_def):
    param_def_str = (m.group(1)
                     #  Hacks!!!
                     .replace('GGC_MIN_EXPAND_DEFAULT', '30')
                     .replace('GGC_MIN_HEAPSIZE_DEFAULT', '4096')
                     .replace('50 * 1024 * 1024', '52428800'))
    try:
      name, desc, default, param_min, param_max = ast.literal_eval(
          '[' + param_def_str.split(',', 1)[1] + ']')
      param_defaults[name] = {'default': default,
                              'min': param_min,
                              'max': param_max}
    except:
      log.exception("error with %s", param_def_str)
  json.dump(param_defaults, open(PARAMS_DEFAULTS_CACHE_FILE, 'w'))

# --------------------
# Extract parameters not causing gcc to barf
# --------------------
working_params = []
params, err = subprocess.Popen(
    [args.cc, '--help=params'], stdout=subprocess.PIPE).communicate()
all_params = re.findall(r'^  ([a-z0-9-]+) ', params.decode("utf-8"), re.MULTILINE)
all_params = sorted(set(all_params) &
                    set(param_defaults.keys()))
if os.path.isfile(PARAMS_WORKING_CACHE_FILE):
  # use cached version
  working_params = json.load(open(PARAMS_WORKING_CACHE_FILE))
else:
  log.info('Determining which of %s possible gcc params work', len(all_params))
  for param in all_params:
    if check_if_flag_works('--param={}={}'.format(
            param, param_defaults[param]['default'])):
      working_params.append(param)
  json.dump(working_params, open(PARAMS_WORKING_CACHE_FILE, 'w'))

# --------------------
# Utils functions
# --------------------
# these bugs are hardcoded for now
# sets of options which causes gcc to barf
if False:
  # These bugs were for gcc 4.7 on ubuntu
  cc_bugs = (['-fipa-matrix-reorg', '-fwhole-program'],
             ['-fno-tree-coalesce-inlined-vars'],
             ['-fno-inline-atomics'],
             ['-ftoplevel-reorder', '-fno-unit-at-a-time'])
else:
  # Bugs for gcc 4.9 (work in progress, incomplete list)
  cc_bugs = (['-ftoplevel-reorder', '-fno-unit-at-a-time'], )

def cfg_to_flags(cfg):
    flags = ['-O%d' % cfg['-O']]
    for flag in found_cc_flags:
        if cfg[flag] == 'on':
            flags.append(flag)
        elif cfg[flag] == 'off':
            flags.append(invert_gcc_flag(flag))

    for param in working_params:
        flags.append('--param=%s=%d' % (param, cfg[param]))

    # workaround sets of flags that trigger compiler crashes/hangs
    for bugset in cc_bugs:
      if len(set(bugset) & set(flags)) == len(bugset):
        flags.remove(bugset[-1])
    return flags

def make_command(cfg):
    return args.compile_template.format(source=args.source, output=args.output,
                                        flags=' '.join(cfg_to_flags(cfg)),
                                        cc=args.cc)
def execute(cmd, times=1):
    p = subprocess.Popen(cmd, stdout=subprocess.PIPE, shell=True)
    out, err = p.communicate()
    return p.returncode

def run_with_flags(flags, cmd=None):
    # pre-compile with flags
    tmp_dir = './' 
    output_dir = '%s/%s' % (tmp_dir, args.output)
    if os.path.isfile(output_dir):
        os.system("rm {}".format(output_dir))

    if cmd is None:
        cmd = args.compile_template.format(source=args.source, output=output_dir,
                                           flags=' '.join(flags), cc=args.cc)
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
    start = time.time_ns()
    code = execute(output_dir)
    end = time.time_ns() 
    return float(end - start) / (10 ** 6)

def flags_mean_time(flags, trials=10):
    total = run_with_flags(flags)
    tmp_dir = './' 
    output_dir = '%s/%s' % (tmp_dir, args.output)
    for _ in range(trials):
        start = time.time_ns()
        code = execute(output_dir)
        end = time.time_ns() 
        total += float(end - start) / (10 ** 6)
    return old_div(total, trials)

def run_baselines():
    print("baseline perfs -O0={}ms -O1={}ms -O2={}ms -O3={}ms".format(
           *[run_with_flags(['-O%d' % i]) for i in range(4)]))

run_baselines()
# -----------------
# Run the autotuning 
# -----------------
options = dict()
options['-O'] = ut.tune(3, (0, 3), name="-O")
for flag in found_cc_flags:
    options[flag] = ut.tune('default', ['on', 'off', 'default'], name=flag)
    
for param in working_params:
    defaults = param_defaults[param]
    if defaults['max'] <= defaults['min']: defaults['max'] = float('inf')
    defaults['max'] = min(defaults['max'], max(1, defaults['default']) * args.scaler)
    defaults['min'] = max(defaults['min'], old_div(max(1, defaults['default']), args.scaler))

    if param == 'l1-cache-line-size':
        # gcc requires this to be a power of two or it internal errors
        options[param] = 2** ut.tune(defaults['default'], 
                (2, 8), name=param) 

    elif defaults['max'] > 128:
        options[param] = ut.tune(defaults['default'], 
                (defaults['min'], defaults['max']), name=param) 
        # m.add_parameter(manipulator.LogIntegerParameter(
        #   param, defaults['min'], defaults['max']))
    else:
        options[param] = ut.tune(defaults['default'], 
                (defaults['min'], defaults['max']), name=param) 

cmd = make_command(options)
runtime = run_with_flags([], cmd)
print("Runtime {}".format(runtime))
ut.target(runtime, "min")
