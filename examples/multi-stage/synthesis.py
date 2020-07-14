def prestage(cfg, design):
    """ 
    run the fisrt stage (before p&r)
    and return guidelines as features
    """

    settings = ""
    options = []
    options.append('Off')                              # adv_netlist_opt_synth_wysiwyg_remap
    options.append('Off')                              # allow_any_ram_size_for_recognition
    options.append('Off')                              # allow_any_rom_size_for_recognition
    options.append('Off')                              # allow_any_shift_register_size_for_recognition
    options.append('On')                               # allow_power_up_dont_care
    options.append('Auto')                             # allow_shift_register_merging_across_hierarchies
    options.append('On')                               # allow_synch_ctrl_usage
    options.append('On')                               # auto_carry_chains
    options.append('On')                               # auto_clock_enable_recogntion
    options.append(cfg['auto_dsp_recognition'])        # auto_dsp_recognition
    options.append('Off')                              # auto_enable_smart_compile 10
    options.append('On')                               # auto_open_drain_pins
    options.append('On')                               # auto_ram_recognition
    options.append('Off')                              # auto_resource_sharing
    options.append('On')                               # auto_rom_recognition
    options.append('Auto')                             # auto_shift_register_recognition
    options.append(cfg['disable_register_merging_across_hierarchies']) # disable_register_merging_across_hierarchies 16
    options.append('Auto')                             # dsp_block_balancing
    options.append('On')                               # enable_state_machine_inference
    options.append('Off')                              # force_synch_clear
    options.append('Off')                              # ignore_carry_buffers 20
    options.append('Off')                              # ignore_cascade_buffers
    options.append('Off')                              # ignore_max_fanout_assignments
    options.append('On')                               # infer_rams_from_raw_logic
    options.append(cfg['mux_restructure'])             # mux_restructure 24
    options.append(cfg['optimization_technique'])      # optimization_technique 25
    options.append('Normal compilation')               # optimize_power_during_synthesis
    options.append('On')                               # remove_duplicate_registers
    options.append('On')                               # shift_register_recognition_aclr_signal
    options.append('Auto')                             # state_machine_processing
    options.append('Off')                              # strict_ram_recognition
    options.append(cfg['synthesis_effort'])            # synthesis_effort 31
    options.append('Off')                              # synthesis_keep_synch_clear_preset_behavior_in_unmapper
    options.append('Off')                              # synth_resource_aware_inference_for_block_ram
    options.append(cfg['synth_timing_driven_synthesis']) #synth_timing_driven_synthesis
    options.append('Medium')                           # alm_register_packing_effort 35
    options.append('On')                               # auto_delay_chains
    options.append('Off')                              # auto_delay_chains_for_high_fanout_input_pins
    options.append('Off')                              # eco_optimize_timing
    options.append('Automatically')                    # final_placement_optimization 39
    options.append(cfg['fitter_aggressive_routability_optimization']) # fitter_aggressive_routability_optimization
    options.append(cfg['fitter_effort'])               # fitter_effort 41
    options.append('On')                               # optimize_for_metastability
    options.append('All Paths')                        # optimize_hold_timing
    options.append('Normal')                           # optimize_ioc_register_placement_for_timing
    options.append('On')                               # optimize_multi_corner_timing 45
    options.append('Normal compilation')               # optimize_power_during_fitting
    options.append('Off')                              # periphery_to_core_placement_and_routing_optimization 47
    options.append('Off')                              # physical_synthesis
    options.append('1.0')                              # placement_effort_multiplier
    options.append('1.0')                              # programmable_power_maximum_high_speed_fraction_of_used_lab_tiles 50
    options.append('Automatic')                        # programmable_power_technology_setting
    options.append('Auto')                             # qii_auto_packed_registers
    options.append('Off')                              # router_clocking_topology_analysis 53
    options.append('Auto')                             # router_lcell_insertion_and_logic_duplication
    options.append('Auto')                             # router_register_duplication
    options.append('Normal')                           # router_timing_optimization_level
    options.append('1')                                # seed
    options.append('Off')                              # tdc_aggressive_hold_closure_effort
    options.append('On')                               # allow_register_retiming

    enumeration = {
        'On':'1',
        'Off':'-1',
        'High':'1',
        'Low':'-1',
        'Medium':'0',
        'Always':'1',
        'Automatically':'0',
        'Never':'-1',
        'Standard Fit':'1',
        'Auto Fit':'-1',
        'All Paths':'1',
        'IO Paths and Minimum TPD Paths':'0',
        'Normal':'1',
        'Pack All IO Registers':'0',
        'Extra effort':'1',
        'Normal compilation':'0',
        'Auto':'0',
        'Automatic':'2',
        'Force All Tiles with Failing Timing Paths to High Speed':'1',
        'Force All Used Tiles to High Speed':'-1',
        'Minimize Power Only':'-2',
        'Minimize Area':'2',
        'Minimize Area with Chains':'3',
        'Sparse':'-2',
        'Sparse Auto':'-3',
        'Minimum':'-1',
        'Maximum':'0',
        'DSP blocks':'1',
        'Logic Elements':'2',
        'Simple 18-bit Multipliers':'-2',
        'Simple Multipliers':'3',
        'Width 18-bit Multipliers':'-3',
        'Balanced':'0',
        'Area':'-1',
        'Speed':'1',
        'Fast':'1',
        'Gray':'1',
        'Johnson':'-1',
        'Minimal Bits':'2',
        'One-Hot':'-2',
        'Sequential':'3',
        'User-Encoded':'-3'
        }


    # --------------------------------------
    # god knows what is happening below
    # --------------------------------------
    k = 0
    for item in options:
      #if k == exceptional: # synthesis_effort's Auto option is enumareted different from the enumeration dictionary
      if k == 31: # synthesis_effort's Auto option is enumareted different from the enumeration dictionary
        if item == "Auto":
          settings += "-1,"
        else:
          settings += str(enumeration[item]) + ","
      elif item == "1": # seed is a number, thus not enumerated
        settings += "1,"
      elif item == "1.0": # placement_effort_multiplier & programmable_power_maximum_high_speed_fraction_of_used_lab_tiles are numbers, thus not enumerated
        settings += "1.0,"
      else:
        settings += str(enumeration[item]) + ","
      k += 1
    settings = settings.rstrip(",")


    # -----------------------------------
    # search the exhaustive space for res
    # -----------------------------------
    f = open("data/" + str(design) +"_LUT.csv", "r")
    lines = f.readlines()
    for i in range(0, len(lines)):
      guideline = None
      if settings in lines[i]:
        guideline = [float(k) for k in lines[i].replace("\n", " ").rstrip().split(",")[:94]]
        break
    f.close()
    return guideline 


def poststage(cfg, design):
    """ 
    run the second stage (p&r)
    and return actual qor
    """
    settings = ""
    options = []
    options.append('Off')                              # adv_netlist_opt_synth_wysiwyg_remap
    options.append('Off')                              # allow_any_ram_size_for_recognition
    options.append('Off')                              # allow_any_rom_size_for_recognition
    options.append('Off')                              # allow_any_shift_register_size_for_recognition
    options.append('On')                               # allow_power_up_dont_care
    options.append('Auto')                             # allow_shift_register_merging_across_hierarchies
    options.append('On')                               # allow_synch_ctrl_usage
    options.append('On')                               # auto_carry_chains
    options.append('On')                               # auto_clock_enable_recogntion
    options.append(cfg['auto_dsp_recognition'])        # auto_dsp_recognition
    options.append('Off')                              # auto_enable_smart_compile 10
    options.append('On')                               # auto_open_drain_pins
    options.append('On')                               # auto_ram_recognition
    options.append('Off')                              # auto_resource_sharing
    options.append('On')                               # auto_rom_recognition
    options.append('Auto')                             # auto_shift_register_recognition
    options.append(cfg['disable_register_merging_across_hierarchies']) # disable_register_merging_across_hierarchies 16
    options.append('Auto')                             # dsp_block_balancing
    options.append('On')                               # enable_state_machine_inference
    options.append('Off')                              # force_synch_clear
    options.append('Off')                              # ignore_carry_buffers 20
    options.append('Off')                              # ignore_cascade_buffers
    options.append('Off')                              # ignore_max_fanout_assignments
    options.append('On')                               # infer_rams_from_raw_logic
    options.append(cfg['mux_restructure'])             # mux_restructure 24
    options.append(cfg['optimization_technique'])      # optimization_technique 25
    options.append('Normal compilation')               # optimize_power_during_synthesis
    options.append('On')                               # remove_duplicate_registers
    options.append('On')                               # shift_register_recognition_aclr_signal
    options.append('Auto')                             # state_machine_processing
    options.append('Off')                              # strict_ram_recognition
    options.append(cfg['synthesis_effort'])            # synthesis_effort 31
    options.append('Off')                              # synthesis_keep_synch_clear_preset_behavior_in_unmapper
    options.append('Off')                              # synth_resource_aware_inference_for_block_ram
    options.append(cfg['synth_timing_driven_synthesis']) # synth_timing_driven_synthesis
    options.append('Medium')                           # alm_register_packing_effort 35
    options.append('On')                               # auto_delay_chains
    options.append('Off')                              # auto_delay_chains_for_high_fanout_input_pins
    options.append('Off')                              # eco_optimize_timing
    options.append('Automatically')                    # final_placement_optimization 39
    options.append(cfg['fitter_aggressive_routability_optimization']) # fitter_aggressive_routability_optimization
    options.append(cfg['fitter_effort'])               # fitter_effort 41
    options.append('On')                               # optimize_for_metastability
    options.append('All Paths')                        # optimize_hold_timing
    options.append('Normal')                           # optimize_ioc_register_placement_for_timing
    options.append('On')                               # optimize_multi_corner_timing 45
    options.append('Normal compilation')               # optimize_power_during_fitting
    options.append('Off')                              # periphery_to_core_placement_and_routing_optimization 47
    options.append('Off')                              # physical_synthesis
    options.append('1.0')                              # placement_effort_multiplier
    options.append('1.0')                              # programmable_power_maximum_high_speed_fraction_of_used_lab_tiles 50
    options.append('Automatic')                        # programmable_power_technology_setting
    options.append('Auto')                             # qii_auto_packed_registers
    options.append('Off')                              # router_clocking_topology_analysis 53
    options.append('Auto')                             # router_lcell_insertion_and_logic_duplication
    options.append('Auto')                             # router_register_duplication
    options.append('Normal')                           # router_timing_optimization_level
    options.append('1')                                # seed
    options.append('Off')                              # tdc_aggressive_hold_closure_effort
    options.append('On')                               # allow_register_retiming

    enumeration = {
        'On':'1',
        'Off':'-1',
        'High':'1',
        'Low':'-1',
        'Medium':'0',
        'Always':'1',
        'Automatically':'0',
        'Never':'-1',
        'Standard Fit':'1',
        'Auto Fit':'-1',
        'All Paths':'1',
        'IO Paths and Minimum TPD Paths':'0',
        'Normal':'1',
        'Pack All IO Registers':'0',
        'Extra effort':'1',
        'Normal compilation':'0',
        'Auto':'0',
        'Automatic':'2',
        'Force All Tiles with Failing Timing Paths to High Speed':'1',
        'Force All Used Tiles to High Speed':'-1',
        'Minimize Power Only':'-2',
        'Minimize Area':'2',
        'Minimize Area with Chains':'3',
        'Sparse':'-2',
        'Sparse Auto':'-3',
        'Minimum':'-1',
        'Maximum':'0',
        'DSP blocks':'1',
        'Logic Elements':'2',
        'Simple 18-bit Multipliers':'-2',
        'Simple Multipliers':'3',
        'Width 18-bit Multipliers':'-3',
        'Balanced':'0',
        'Area':'-1',
        'Speed':'1',
        'Fast':'1',
        'Gray':'1',
        'Johnson':'-1',
        'Minimal Bits':'2',
        'One-Hot':'-2',
        'Sequential':'3',
        'User-Encoded':'-3'
        }


    # --------------------------------------
    # god knows what is happening below
    # --------------------------------------
    k = 0
    for item in options:
      #if k == exceptional: # synthesis_effort's Auto option is enumareted different from the enumeration dictionary
      if k == 31: # synthesis_effort's Auto option is enumareted different from the enumeration dictionary
        if item == "Auto":
          settings += "-1,"
        else:
          settings += str(enumeration[item]) + ","
      elif item == "1": # seed is a number, thus not enumerated
        settings += "1,"
      elif item == "1.0": # placement_effort_multiplier & programmable_power_maximum_high_speed_fraction_of_used_lab_tiles are numbers, thus not enumerated
        settings += "1.0,"
      else:
        settings += str(enumeration[item]) + ","
      k += 1
    settings = settings.rstrip(",")

    # -----------------------------------
    # search the exhaustive space for res
    # -----------------------------------
    f = open("data/" + str(design) + "_LUT.csv", "r")
    lines = f.readlines()
    for i in range(0, len(lines)):
      result = 999999 # setting not found in the exhaustive database (i.e. LUT)
      guideline = "None"
      if settings in lines[i]:
        slack = float(lines[i].replace("\n", " ").rstrip().split(",")[-4])
        result = -1 * slack
        guideline = (','.join(str(i) for i in lines[i].replace("\n", " ").rstrip().split(",")[:94]))
        guideline += ',' + str(slack)
        break
    f.close()
    return result 


