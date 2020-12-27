#!/bin/bash
execute() { echo "\$ $@" ; "$@" ; }
INTEL_VALB_MODE=true
DESIGN="$1"

if [ "$INTEL_VALB_MODE" = true ] ; then
    echo '[ INFO ] submitting jobs to qsub batch...'
    # Casse 1: on Intel vLabs to sumbit jobs to remote nodes
    # sharing the same file system

    JOB=JOB$UT_CURR_INDEX
    if [ -z $UT_CURR_INDEX ]; then
        CURR_PATH="."
    else
        # When executing the script, the workdir has been renamed
        CURR_PATH="$UT_WORK_DIR/ut-work-dir/$UT_CURR_INDEX-inuse"
    fi

    # Wait for the job to finish
    execute qsub -v "path=${PWD}" -l walltime=36:00:00 -N job${UT_CURR_INDEX} -o aocl.out \
        -e aocl.err -Wblock=true qsub-run.sh
    # -m ea -M xiang.elec@gmail.com

    if [ -z $UT_CURR_INDEX ]; then
        echo "In profiling mode -- cleaning up the temp files..."
        rm -rf "$DESIGN.aoc* $DESIGN $DESIGN*temp $DESIGN.link* time.out reg.err aocl.err aocl.out"
    fi

# Case 2: local machine multi-threads
# Execute the build script directly
else 
    MODE="FULL"
    if [ $# -gt 0 ]; then
        MODE=$1
    fi

    source /work/shared/common/Intel/intelFPGA_pro/19.4/hld/init_opencl.sh
    if [ $MODE == "EMU" ]; then
        echo "Compiling in emulator mode..."
        aoc -march=emulator -board=a10gx -time time.out -time-passes -regtest_mode -v -fpc -fp-relaxed -opt-arg -nocaching -report gemm.cl
    elif [ $MODE == "CLEAN" ]; then 
        echo "Cleaning tmp files..."
        rm -rf *.aoc* time.out gemm
    else
        echo "Compiling in bitstream mode..."
        aoc -board=a10gx -time time.out -time-passes -regtest_mode -v -fpc -fp-relaxed -opt-arg -nocaching -report gemm.cl
    fi
fi
