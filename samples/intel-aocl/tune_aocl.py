import os, sys, re, time, json
from options import options
import uptune as ut
import threading, random, subprocess
from collections import OrderedDict 
import argparse
from multiprocessing import Process

THREAD = 6
design = "gemm"
TIMEOUT = 20 * 60 * 60 

def run_process(cmd, pattern=None, env=None, debug=True):
    print("[ DEBUG ] Running commands: \n{}\n".format(cmd))
    p = subprocess.Popen(cmd, stdout=subprocess.PIPE, shell=True)
    out, err = p.communicate()
    if err: raise RuntimeError("Error raised: ", err.decode())
    if pattern: return re.findall(pattern, out.decode("utf-8"))
    if debug: 
        print("[ DEBUG ] Commands outputs: \n{}\n".format(out.decode("utf-8")))
    return out.decode("utf-8")


# Add configuration to QSF files
def config(option):
    qsf_top = "{}/top.qsf".format(design)
    qsf_afu = "{}/afu_opencl_kernel.qsf".format(design)

    # Wait HLS to be finished
    while(1):
        if not (os.path.exists(qsf_top) or os.path.exists(qsf_afu)): 
            time.sleep(2)
        else: 
            break

    print("[ DEBUG ] Configuring the QSF")
    if os.path.exists(qsf_top): 
        qsf = qsf_top
    if os.path.exists(qsf_afu): 
        qsf = qsf_afu

    # Write global assignment
    with open(qsf, "a") as fp:
        fp.write("# Start of config\n")
        for key, value in option.items():
            if " " in str(value):
                fp.write("set_global_assignment -name {} \"{}\"\n".format(key, value))
            else:
                fp.write("set_global_assignment -name {} {}\n".format(key, value))
        fp.write("# End of config\n")

    with open("{}/option.json".format(design), "w") as write_file:
        json.dump(option, write_file)

def execute(design):
    cmd = "./run.sh {}".format(design)
    run_process(cmd)

def cleanup():
    cmd = "rm -rf {} {}*.temp/ {}.aoc* {}.linked.aoco.bc reg.err time.out".\
        format(design, design, design, design)
    run_process(cmd)

def main(parse_only=False):

    # Create an EDA option pool
    if not parse_only:
        cleanup()
        option = OrderedDict()
        for key, values in options.items():
            option[key] = ut.tune(values[0], values, name=key)

        # If the design folder is symbolic
        if os.path.islink(design):
            os.unlink(design)

        t1 = Process(target=config, args=(option, )) 
        t2 = Process(target=execute, args=(design, )) 
        t1.daemon = True
        t2.daemon = True
        t1.start()
        t2.start()
        t1.join()
        t2.join()

    qor = 0; index = "default"
    work_path = os.path.abspath("./")
    
    # TODO: Parse the data
    # We just copy the rpt to separate folder
    if os.getenv("UT_TUNE_START"):        
        index = ut.get_global_id()
        work_path = os.path.join(ut.get_meta_data("UT_WORK_DIR"), "ut-work-dir")

    index = "ut-rpt-{}".format(index)
    rpt_folder = os.path.join(work_path, str(index))
    cmd = "mkdir -p {}; ".format(rpt_folder)
    cmd += "cd {}; ".format(design)
    cmd += "cp acl_quartus_report.txt quartus_sh_compile.log *json *rpt *qsf {}; cp ../*log {}".format(rpt_folder, rpt_folder)
    run_process(cmd)

    # Read frequency
    rpt = "{}/acl_quartus_report.txt".format(rpt_folder)
    if os.path.isfile(rpt):
        with open(rpt, "r") as fp:
            content = str(fp.readlines())
            match = re.search(r"Kernel fmax: (\d+\.\d+)", content)
            qor = float(match[1])
    else:
        print("Cannot find acl quartus report...")
        qor = -1 * float("inf")
    
    # Remove temp in profiling phase
    if os.getenv("UT_BEFORE_RUN_PROFILE"):
        cleanup()

    # Set the target
    ut.target(qor, "max")

if __name__ == "__main__": 
    parse_only = False
    main(parse_only)
