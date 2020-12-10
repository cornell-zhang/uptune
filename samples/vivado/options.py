from collections import OrderedDict 

# option pool to configure the 
# vitis config.ini in vivado head section
# 1. example in Vitis Library: 
#   https://github.com/Xilinx/Vitis_Libraries/blob/master/database/L1/benchmarks/hash_group_aggregate/opts.ini
# 2. UG904 Vivao Synthesis User Guide:
#   https://www.xilinx.com/support/documentation/sw_manuals/xilinx2016_2/ug904-vivado-implementation.pdf
# 3. Vitis User guide page 300
#   http://xilinx.eetrend.com/files/2019-10/wen_zhang_/100045696-82978-vitis-application-acceleration.pdf

options = {

    # Analysis and Synthesis Assignment
    # The first value in the list is the default value
    # ==================

    # HLS and Vivado target frequency
    # the default clock frequency should be 300 MHZ from UG1120
    "Frequency"                     : (250, 500),

    # Logic optimization 
    "OPT_DESIGN.ARGS.DIRECTIVE"     :
        ["Explore", "ExploreArea", "AddRemap", "ExploreSequentialArea", 
         "RuntimeOptimized", "NoBramPowerOpt", "ExploreWithRemap", 
         "Default"],

    # Placement directive 
    "PLACE_DESIGN.ARGS.DIRECTIVE"    : 
        ["Explore", "WLDrivenBlockPlacement", 
         "ExtraNetDelay_high", "ExtraNetDelay_low", 
         "SSI_SpreadLogic_high", "SSI_SpreadLogic_low", 
         "AltSpreadLogic_high", "AltSpreadLogic_medium", "AltSpreadLogic_low",
         "ExtraPostPlacementOpt", "ExtraTimingOpt", 
         "SSI_SpreadSLLs", "SSI_BalanceSLLs", "SSI_BalanceSLRs", "SSI_HighUtilSLRs",
         "RuntimeOptimized", "Quick", "Default"],
    
    # Physical optimization and flags
    "PHYS_OPT_DESIGN.IS_ENABLED"     : ["true", "false"],
    "PHYS_OPT_DESIGN.ARGS.DIRECTIVE" : 
        ["Explore", "ExploreWithHoldFix", "ExploreWithAggressiveHoldFix",
         "AggressiveExplore", "AlternateReplication", "AggressiveFanoutOpt", "AddRetime",
         "AlternateFlowWithRetiming", "Default", 
         "Disabled"], # If disabled, we only use the -more arguments
         
    "PHYS_OPT_DESIGN.ARGS.MORE.fanout_opt"              : ["on", "off"],
    "PHYS_OPT_DESIGN.ARGS.MORE.placement_opt"           : ["off", "on"],
    "PHYS_OPT_DESIGN.ARGS.MORE.routing_opt"             : ["off", "on"],
    "PHYS_OPT_DESIGN.ARGS.MORE.rewire"                  : ["off", "on"],
    "PHYS_OPT_DESIGN.ARGS.MORE.critical_cell_opt"       : ["off", "on"],
    "PHYS_OPT_DESIGN.ARGS.MORE.dsp_register_opt"        : ["off", "on"],
    "PHYS_OPT_DESIGN.ARGS.MORE.bram_register_opt"       : ["off", "on"],
    "PHYS_OPT_DESIGN.ARGS.MORE.bram_enable_opt"         : ["off", "on"],
    "PHYS_OPT_DESIGN.ARGS.MORE.shift_register_opt"      : ["off", "on"],
    "PHYS_OPT_DESIGN.ARGS.MORE.retime"                  : ["off", "on"],
    "PHYS_OPT_DESIGN.ARGS.MORE.critical_pin_opt"        : ["off", "on"],
    "PHYS_OPT_DESIGN.ARGS.MORE.clock_opt"               : ["off", "on"],
    "PHYS_OPT_DESIGN.ARGS.MORE.hold_fix"                : ["off", "on"],
 
    # Route design (and more options)
    "ROUTE_DESIGN.ARGS.DIRECTIVE"    : 
        ["Explore", "NoTimingRelaxation", "MoreGlobalIterations",
         "HigherDelayCost", "RuntimeOptimized", "AlternateCLBRouting",
         "Quick", "Default"],
    # Example: prop=run.impl_1.{STEPS.ROUTE_DESIGN.ARGS.MORE OPTIONS}={-tns_cleanup}
    "ROUTE_DESIGN.ARGS.MORE.tns_cleanup" : ["off", "on"],
    
    # Post route physical optimization
    "POST_ROUTE_PHYS_OPT_DESIGN.IS_ENABLED" : ["true", "false"],
    "POST_ROUTE_PHYS_OPT_DESIGN.ARGS.DIRECTIVE" :
        ["AggressiveExplore", "Default"]
}

options = OrderedDict(options)
  
if __name__ == '__main__':
    for key, value in options.items(): 
        print(key, value) 
