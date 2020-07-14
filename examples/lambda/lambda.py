#!/usr/bin/env python

# -------------------------------------------------------------------
# the script will be executed by both attempt and validate function 
# -------------------------------------------------------------------
import sys
from synthesis import prestage, poststage
from uptune import feedback, autotune, interm

designs = ['fir', 'mm3', 'aes', 'ode', 'syn2', 'dscg']
assert len(sys.argv) == 2, \
       "usage: python lambda.py design_name"
assert sys.argv[1] in designs, \
       "support designs: fir mm3 aes ode syn2 dscg"
design = sys.argv[1]

auto_dsp_recognition = autotune('On', ['On', 'Off'])
disable_register_merging_across_hierarchies = autotune('On', ['On', 'Off', 'Auto'])
mux_restructure = autotune('Off', ['On', 'Off', 'Auto'])
optimization_technique = autotune('Area', ['Area', 'Speed', 'Balanced'])
synthesis_effort = autotune('Auto', ['Auto', 'Fast'])
synth_timing_driven_synthesis = autotune('On', ['On', 'Off'])
fitter_aggressive_routability_optimization = autotune('Never', ['Always', 'Automatically', 'Never'])
fitter_effort = autotune('Auto Fit', ['Standard Fit', 'Auto Fit'])
remove_duplicate_registers = autotune('On', ['On', 'Off'])
physical_synthesis = autotune('On', ['On', 'Off'])

arg_list = (
    'auto_dsp_recognition', 
    'disable_register_merging_across_hierarchies',
    'mux_restructure',
    'optimization_technique',    
    'synthesis_effort',
    'synth_timing_driven_synthesis',
    'fitter_aggressive_routability_optimization',
    'fitter_effort',
    'remove_duplicate_registers',
    'physical_synthesis'
)


cfg = dict()
for i in arg_list:
    cfg[i] = locals()[i]  

# -----------------------------------
# run thru logic synthesis & packing 
# -----------------------------------
# features will be returned & rated by ML modesl
# the program exits with less promising result
features = interm(prestage(cfg, design))

# -----------------------------------
# run thru placing and routing 
# -----------------------------------
qor = feedback(poststage(cfg, design))
