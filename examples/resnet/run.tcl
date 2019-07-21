#=============================================================================
# run_base.tcl 
#=============================================================================

# Project name
set hls_prj resnet.prj

# Open/reset the project
open_project ${hls_prj} -reset

# Top function of the design is "dut"
set_top dut

# Add design and testbench files
add_files -tb vhls.cpp
add_files vhls.cpp

open_solution "solution1"
# Use Zynq device
set_part {xc7z020clg484-1}

# Target clock period is 10ns
create_clock -period 10

# Simulate the C++ design
csim_design -O
# Synthesize the design
csynth_design
# Co-simulate the design
#cosim_design
exit
