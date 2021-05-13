import os, sys, re, time, json
from options import options
import uptune as ut
import threading, random, subprocess
from collections import OrderedDict 
import argparse
from multiprocessing import Process

platform = "/opt/xilinx/platforms/xilinx_u280_xdma_201920_1/xilinx_u280_xdma_201920_1.xpfm"
design = "optical_flow.cpp"
top = "optical_flow"


def run_process(cmd, pattern=None, env=None, debug=True):
    print("[ DEBUG ] Running commands: \n{}\n".format(cmd))
    p = subprocess.Popen(cmd, stdout=subprocess.PIPE, shell=True)
    out, err = p.communicate()
    if err: raise RuntimeError("Error raised: ", err.decode())
    if pattern: return re.findall(pattern, out.decode("utf-8"))
    if debug: 
        print("[ DEBUG ] Commands outputs: \n{}\n".format(out.decode("utf-8")))
    return out.decode("utf-8")


# Create config files for vitis
def config(option):
    params_temp = "prop=run.impl_1.STEPS.{}={}\n"
    flags_temp  = "prop=run.impl_1.{{STEPS.{}.MORE OPTIONS}}=" 

    with open("hls_config.ini", "w") as fp:
        fp.write("kernel_frequency={}\n".format(option["Frequency"]))
    
    with open("link_config.ini", "w") as fp:
        fp.write("kernel_frequency={}\n".format(option["Frequency"]))
        fp.write("[vivado]\n")

        stage_options = dict()
        disabled_stage = list()
        stage_with_directive = list()
        for key, value in option.items():
            if key == "Frequency": continue
            if "MORE" in key:
                stage, flag = key.split(".ARGS.MORE.")
                if stage not in stage_options:
                    stage_options[stage] = []
                if value == "on":
                    stage_options[stage].append(flag)

            elif "IS_ENABLED" in key:
                stage, _ = key.split(".") 
                if value == "false":
                    disabled_stage.append(stage)
                else:
                    fp.write(params_temp.format(key, value))

            # optimization mode
            elif "ARGS.DIRECTIVE" in key:
                stage = key.split(".")[0]
                if stage not in disabled_stage:
                    if value != "Disabled":
                        fp.write(params_temp.format(key, value))
                        stage_with_directive.append(stage)
        
        # write stage flags
        for stage, flags in stage_options.items():
            if len(flags) == 0: 
                continue
            if stage in disabled_stage: 
                continue
            if stage in stage_with_directive: 
                continue
            item = flags_temp.format(stage)
            item += "{"
            delim = ""
            for flag in flags:
                item += delim + "-" + flag
                delim = " "
            item += "}\n"
            fp.write(item)
    
def execute(pwd):
    cmd = "./run.sh {} {} {} {}".format(pwd, platform, design, top)
    run_process(cmd)

def cleanup():
    cmd = "make clean; rm -rf *log _x.hw* build_dir.hw.* link_config.ini hls_config.ini"
    run_process(cmd)

def main(parse_only=False):

    # Create an EDA option pool
    option = OrderedDict()
    if not parse_only:
        cleanup()
        for key, values in options.items():
            option[key] = ut.tune(values[0], values, name=key)

        config(option)
        pwd = os.getcwd()
        t1 = Process(target=execute, args=(pwd,)) 
        t1.daemon = True
        t1.start()
        t1.join()

    # Extract QoR result
    qor = 0; index = "default"
    work_path = os.path.abspath("./")
    
    # TODO: Parse the data
    # We just copy the rpt to separate folder
    if os.getenv("UT_TUNE_START"):        
        index = ut.get_global_id()
        work_path = os.path.join(ut.get_meta_data("UT_WORK_DIR"), "ut.temp")

    index = "ut.rpt.{}".format(index)
    rpt_folder = os.path.join(work_path, str(index))

    cmd = "mkdir -p {}; cp build_dir.hw.xilinx_u280_xdma_201920_1/reports/link/imp/* {}"\
        .format(rpt_folder, rpt_folder)
    run_process(cmd)
    # cp the vivado log and config files
    cmd = "cp build_dir.hw.xilinx_u280_xdma_201920_1/link/vivado/vpl/vivado.log {}; cp *config.ini {}"\
        .format(rpt_folder, rpt_folder)
    run_process(cmd)

    # Read frequency
    rpt = "{}/xilinx_u280_xdma_201920_1_bb_locked_timing_summary_postroute_physopted.rpt".format(rpt_folder)
    if os.path.isfile(rpt):
        with open(rpt, "r") as fp:
            content = fp.readlines()
            index = 0
            for line in content:
                if "Design Timing Summary" in line:
                    numbers = content[index+6].strip().split()
                    wns = float(numbers[0])
                    tns = float(numbers[1])
                    qor = (1000 / float(option["Frequency"])) - wns
                    break
                index += 1
    else:
        print("Cannot find vivado timing report...")
        qor = float("inf")
    
    # Remove temp in profiling phase
    if os.getenv("UT_BEFORE_RUN_PROFILE"):
        cleanup()

    # Set the target
    ut.target(qor, "min")

if __name__ == "__main__": 
    parse_only = False
    main(parse_only)
