#!/usr/bin/env python

# -------------------------------------------------------------------
# the script will be executed by both attempt and validate function 
# -------------------------------------------------------------------
import sys
from synthesis import prestage, poststage
from uptune import feedback, interm

designs = ['fir', 'mm3', 'aes', 'ode', 'syn2', 'dscg']
assert len(sys.argv) == 2, \
       "usage: python lambda.py design_name"
assert sys.argv[1] in designs, \
       "support designs: fir mm3 aes ode syn2 dscg"
design = sys.argv[1]

auto_dsp_recognition = 'On'                        # {% auto_dsp_recognition = TuneEnum('On', ['On', 'Off']) %} 
disable_register_merging_across_hierarchies = 'On' # {% disable_register_merging_across_hierarchies = TuneEnum('On', ['On', 'Off', 'Auto']) %}
mux_restructure = 'Off'                            # {% mux_restructure= TuneEnum('On', ['On', 'Off', 'Auto'], 'mux_restructure') %}
optimization_technique = 'Area'                    # {% optimization_technique=TuneEnum('Area', ['Area', 'Speed', 'Balanced']) %}
synthesis_effort = 'Auto'                          # {% synthesis_effort=TuneEnum('Auto', ['Auto', 'Fast']) %} 
synth_timing_driven_synthesis = 'On'               # {% synth_timing_driven_synthesis=TuneEnum('On', ['On', 'Off']) %} 

# {% fitter_aggressive_routability_optimization=TuneEnum('Never', ['Always', 'Automatically', 'Never']) %}
fitter_aggressive_routability_optimization = 'Never' # {% fitter_effort=TuneEnum('Auto Fit', ['Standard Fit', 'Auto Fit']) %} 
fitter_effort = 'Auto Fit' # ['Standard Fit', 'Auto Fit'])
remove_duplicate_registers = 'On'
physical_synthesis = 'Off'


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
