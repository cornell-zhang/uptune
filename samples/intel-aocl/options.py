from collections import OrderedDict 

options = {

    # Analysis and Synthesis Assignment
    # ==================
    "REMOVE_REDUNDANT_LOGIC_CELLS"   : ["ON", "OFF"],
    "REMOVE_DUPLICATE_REGISTERS"     : ["OFF", "ON"],
    "OPTIMIZATION_TECHNIQUE"         : ["SPEED", "AREA", "BALANCED"], 
    "SAFE_STATE_MACHINE"             : ["ON", "OFF"], 
    "TIMEQUEST_MULTICORNER_ANALYSIS" : ["ON", "OFF"],
    "OPTIMIZE_MULTI_CORNER_TIMING"   : ["ON", "OFF"],
    "FITTER_AGGRESSIVE_ROUTABILITY_OPTIMIZATION" : ["ALWAYS", "NEVER", "AUTOMATICALLY"],
    "REMOVE_DUPLICATE_LOGIC"         : ["OFF", "ON"],
    "SYNTH_TIMING_DRIVEN_SYNTHESIS"  : ["OFF", "ON"], 
    "SYNTH_PROTECT_SDC_CONSTRAINT"   : ["OFF", "ON"], 
    "ADV_NETLIST_OPT_SYNTH_WYSIWYG_REMAP" : ["OFF", "ON"],

    "AUTO_CARRY_CHAINS"                   : ["OFF", "ON"],
    "AUTO_CLOCK_ENABLE_RECOGNITION"       : ["OFF", "ON"],
    "AUTO_DSP_RECOGNITION"                : ["OFF", "ON"],
    "AUTO_ROM_RECOGNITION"                : ["OFF", "ON"],
    "AUTO_PARALLEL_SYNTHESIS"             : ["OFF", "ON"],
    "AUTO_RESOURCE_SHARING"               : ["ON", "OFF"],

    "ALLOW_ANY_ROM_SIZE_FOR_RECOGNITION"  : ["OFF", "ON"], 
    "ALLOW_ANY_RAM_SIZE_FOR_RECOGNITION"  : ["OFF", "ON"],
    "ALLOW_ANY_SHIFT_REGISTER_SIZE_FOR_RECOGNITION" : ["OFF", "ON"],
    "STATE_MACHINE_PROCESSING"            
        : ["Sequential", "Johnson", "Gray", "Minimal Bits", "User-Encoded", "One-Hot", "Auto"],
    "MUX_RESTRUCTURE"                     : ["OFF", "ON", "AUTO"],

    # Fitter Assignments
    # ==================
    "OPTIMIZE_FAST_CORNER_TIMING"         : ["ON", "OFF"],
    "FITTER_EFFORT"                       : ["STANDARD FIT", "FAST FIT", "AUTO FIT"],
    "ROUTER_REGISTER_DUPLICATION"         : ["ON", "OFF", "AUTO"],
    "PHYSICAL_SYNTHESIS"                  : ["ON" , "OFF"],
    "SYNTHESIS_EFFORT"                    : ["FAST", "AUTO"],
    "OPTIMIZE_TIMING"                     : ["Normal compilation", "OFF"], 
    "ROUTER_TIMING_OPTIMIZATION_LEVEL"    : ["MAXIMUM", "MINIMUM", "NORMAL"],
    "ALLOW_REGISTER_RETIMING"             : ["ON", "OFF"], 
    "PLACEMENT_EFFORT_MULTIPLIER"         : [3.0, 4.0], # 1.0, 2.0
    "SEED"                                : (1, 15),
    "OPTIMIZE_FOR_METASTABILITY"          : ["OFF", "ON"],
    "OPTIMIZE_IOC_REGISTER_PLACEMENT_FOR_TIMING" : ["Pack All IO Registers", "Normal", "Off"], 
    "OPTIMIZE_PERSONA_ROUTABILITY"        : ["ON", "OFF"],
        
    # Device Specific Options
    # "ALTERA_A10_IOPLL_BOOTSTRAP"          : ["ON", "OFF"],
} 

options = OrderedDict(options);
  
if __name__ == '__main__':
    for key, value in options.items(): 
        print(key, value) 
