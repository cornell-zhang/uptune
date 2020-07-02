# UpTune Project 

![version](https://img.shields.io/badge/version-2020.06-blue?style=flat-square)
![license](https://img.shields.io/badge/license-BSD-brightgreen?style=flat-square)
![build](https://img.shields.io/circleci/build/github/cornell-zhang/uptune/master?style=flat-square)

A Generic Distributed Auto-Tuning Framework. 

## Getting Started

### Installation

The uptune framework has python and C++ API bindings, and we install both by default. The C++ binding requires cmake (>2.8), gcc (>4.8.5) and GoogleTest to be installed. To install uptune, simply pull it back and run the install script with the following commands:

```shell
git clone https://github.com/cornell-zhang/uptune.git; cd uptune;
./install.sh 
```

### Quick Start 

Here is a quick example to walk you through the basic usage of uptune APIs. Intel Quartus is a EDA tool that compiles RTL design into FPGA bitstream. In this example we explore through the design space of Quartus tool options to maximize the clock frequency of the generated bitstream.  
 
```python
import uptune as ut

# define tuning options
options = {

    "REMOVE_REDUNDANT_LOGIC_CELLS"   : ["ON", "OFF"],
    "REMOVE_DUPLICATE_REGISTERS"     : ["OFF", "ON"],
    "SEED"                           : range(1, 15),
    "PLACEMENT_EFFORT_MULTIPLIER"    : (3.0, 4.0),
    # ....
}

# configure quartus tool options
with open("config.tcl", "w") as f:
    for k, v in options.items():
        prop = ut.tune(v[0], v, name=k)
        f.write("set_global_assignment {} {}\n".format(k, prop))

# run the quartus with config script
subprocess.Popen(["quartus_sh", "-t", "config.tcl"])

# extract and return the qor 
freq = ut.report.quartus(design)["frequency"]
ut.target(freq, "max")
```

Save the program above as a python file (we use the name `program.py` in this example) and start tuning the program in different modes. In the default mode, `ut.tune()` returns the first argument it receives to the caller (i.e. the tuning is disabled).

```shell
# 1. run in default mode (i.e. tuning is disabled)
python program.py

# 2. start tuning the program with 4 parallel processes 
uptune program.py -pf 4
python -m uptune.on program.py -pf 4

# 3. run the tuning with built-in or user-defined ML models
uptune program.py -pf 4 -lm xgbregressor
python -m uptune.on program.py -pf 4

```
