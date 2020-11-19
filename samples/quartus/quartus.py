#!/usr/bin/env python

# -------------------------------------------------------------------
# the script will be executed by both attempt and validate function 
# -------------------------------------------------------------------
import sys
import uptune as ut
from synthesis import prestage, poststage

designs = ['fir', 'mm3', 'aes', 'ode', 'syn2', 'dscg']
assert len(sys.argv) == 2, \
       "usage: python multi_stage.py design_name"
assert sys.argv[1] in designs, \
       "support designs: fir mm3 aes ode syn2 dscg"
design = sys.argv[1]

auto_dsp_recognition = ut.tune('On', ['On', 'Off'])
disable_register_merging_across_hierarchies = ut.tune('On', ['On', 'Off', 'Auto'])
mux_restructure = ut.tune('Off', ['On', 'Off', 'Auto'])
optimization_technique = ut.tune('Area', ['Area', 'Speed', 'Balanced'])
synthesis_effort = ut.tune('Auto', ['Auto', 'Fast'])
synth_timing_driven_synthesis = ut.tune('On', ['On', 'Off'])
fitter_aggressive_routability_optimization = ut.tune('Never', ['Always', 'Automatically', 'Never'])
fitter_effort = ut.tune('Auto Fit', ['Standard Fit', 'Auto Fit'])
remove_duplicate_registers = ut.tune('On', ['On', 'Off'])
physical_synthesis = ut.tune('On', ['On', 'Off'])

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

config = dict()
for i in arg_list:
    config[i] = locals()[i]  

# -----------------------------------
# run thru logic synthesis & packing 
# -----------------------------------
# features will be returned & rated by ML modesl
# the program exits with less promising result
features = ut.interm(prestage(config, design))

# -----------------------------------
# run thru placing and routing 
# -----------------------------------
qor = ut.target(poststage(config, design))
