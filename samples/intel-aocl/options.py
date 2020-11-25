from collections import OrderedDict 

options = {

    # Analysis and Synthesis Assignment
    # The first value in the list is the default value
    # ==================
    "REMOVE_REDUNDANT_LOGIC_CELLS"   : ["On", "Off"],
    "REMOVE_DUPLICATE_REGISTERS"     : ["Off", "On"],
    "OPTIMIZATION_TECHNIQUE"         : ["SPEED", "AREA", "BALANCED"], 
    "SAFE_STATE_MACHINE"             : ["On", "Off"], 

    # Should be enabled to create timing analysis report
    # "TIMEQUEST_MULTICORNER_ANALYSIS" : ["On", "Off"],

    "OPTIMIZE_MULTI_CORNER_TIMING"   : ["On", "Off"],
    "FITTER_AGGRESSIVE_ROUTABILITY_OPTIMIZATION" : ["ALWAYS", "NEVER", "AUTOMATICALLY"],
    "REMOVE_DUPLICATE_LOGIC"         : ["Off", "On"],
    "SYNTH_TIMING_DRIVEN_SYNTHESIS"  : ["Off", "On"], 
    "SYNTH_PROTECT_SDC_CONSTRAINT"   : ["Off", "On"], 
    "ADV_NETLIST_OPT_SYNTH_WYSIWYG_REMAP" : ["Off", "On"],

    "AUTO_CARRY_CHAINS"                   : ["Off", "On"],
    "AUTO_CLOCK_ENABLE_RECOGNITION"       : ["Off", "On"],
    "AUTO_DSP_RECOGNITION"                : ["Off", "On"],
    "AUTO_ROM_RECOGNITION"                : ["Off", "On"],
    "AUTO_PARALLEL_SYNTHESIS"             : ["Off", "On"],
    "AUTO_RESOURCE_SHARING"               : ["On", "Off"],

    "ALLOW_ANY_ROM_SIZE_FOR_RECOGNITION"  : ["Off", "On"], 
    "ALLOW_ANY_RAM_SIZE_FOR_RECOGNITION"  : ["Off", "On"],
    "ALLOW_ANY_SHIFT_REGISTER_SIZE_FOR_RECOGNITION" : ["Off", "On"],
    "STATE_MACHINE_PROCESSING"            
        : ["Sequential", "Johnson", "Gray", "Minimal Bits", "User-Encoded", "One-Hot", "Auto"],
    "MUX_RESTRUCTURE"                     : ["Off", "On", "Auto"],

    # Fitter Assignments
    # ==================
    "OPTIMIZE_FAST_CORNER_TIMING"         : ["On", "Off"],

    # Only standard fit supported for S10
    # "FITTER_EFFORT"                       : ["STANDARD FIT"], # , "FAST FIT", "AUTO FIT"

    "ROUTER_REGISTER_DUPLICATION"         : ["On", "Off", "Auto"],
    "PHYSICAL_SYNTHESIS"                  : ["On" , "Off"],
    "SYNTHESIS_EFFORT"                    : ["Fast", "Auto"],
    "OPTIMIZE_TIMING"                     : ["Normal compilation", "Off"], 
    "ROUTER_TIMING_OPTIMIZATION_LEVEL"    : ["MAXIMUM", "MINIMUM", "Normal"],
    "ALLOW_REGISTER_RETIMING"             : ["On", "Off"], 
    "PLACEMENT_EFFORT_MULTIPLIER"         : [3.0, 4.0], # 1.0, 2.0
    "SEED"                                : (1, 25),
    "OPTIMIZE_FOR_METASTABILITY"          : ["Off", "On"],
    "OPTIMIZE_IOC_REGISTER_PLACEMENT_FOR_TIMING" : ["Pack All IO Registers", "Normal", "Off"], 

    # Set as off in base QSF (to avoid conflicts)
    # "OPTIMIZE_PERSONA_ROUTABILITY"        : ["Off"], # "On", 
        
    # Device Specific Options
    # "ALTERA_A10_IOPLL_BOOTSTRAP"          : ["On", "Off"],
} 

options = OrderedDict(options)
  
if __name__ == '__main__':
    for key, value in options.items(): 
        print(key, value) 
