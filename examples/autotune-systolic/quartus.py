#!/usr/bin/env python
import uptune as ut
import subprocess

option_dict = dict()
option_dict["auto_dsp_recognition"] = ut.tune('On', ['On', 'Off'])
option_dict["disable_register_merging_across_hierarchies"] = ut.tune('Auto', ['On', 'Off', 'Auto'])
option_dict["mux_restructure"] = ut.tune('Auto', ['On', 'Off', 'Auto'])
option_dict["optimization_technique"] = ut.tune('Balanced', ['Area', 'Speed', 'Balanced'])
option_dict["synthesis_effort"] = ut.tune('Auto', ['Auto', 'Fast'])
option_dict["synth_timing_driven_synthesis"] = ut.tune('On', ['On', 'Off'])
option_dict["fitter_aggressive_routability_optimization"] = ut.tune('Automatically', ['Always', 'Automatically', 'Never'])
option_dict["fitter_effort"] = ut.tune('Auto Fit', ['Standard Fit', 'Auto Fit'])
option_dict["remove_duplicate_registers"] = ut.tune('On', ['On', 'Off'])
option_dict["physical_synthesis"] = ut.tune('Off', ['On', 'Off'])

# Generate options.tcl that has the flag assignments
cfg = ""
for k, v in option_dict.items() :
  cfg += 'set_global_assignment -name \"' + k + '\" \"' + v + '\"\n'
f = open('options.tcl', 'w')
f.write(cfg)
f.close()

# Invoke Quartus Pro
subprocess.Popen('quartus_sh -t ./run.tcl', shell=True).wait()

# Parse slack
def get_timing(workdir, stage):
  slack , tns =  'None', 'None'
  f = open(workdir + '/Systolic_Array_8x8.sta.' + stage + '.summary', 'r')
  while True:
    line = f.readline()
    if 'Slack' in line:
      slack = format(float(line.split(':')[-1].rstrip().lstrip().replace(',','')), '.2f')
      continue
    elif 'TNS' in line:
      tns = format(float(line.split(':')[-1].rstrip().lstrip().replace(',','')), '.2f')
      break
  f.close()
  return slack, tns

workdir = "/work/zhang-x2/users/sx233/uptune/examples/autotune-systolic/build"
slack, tns = get_timing(workdir, "route")
print(slack)

