#!/bin/bash
execute() { echo "\$ $@" ; "$@" ; }
INTEL_VALB_MODE=false


if [ "$INTEL_VALB_MODE" = true ] ; then
    echo '[ INFO ] submitting jobs to qsub batch...'
    # Casse 1: on Intel vLabs to sumbit jobs to remote nodes
    # sharing the same file system

    execute qsub -v "path=${PWD}" -N job${UT_CURR_INDEX} -o output/aocl.out \
        -e output/aocl.err -m ea -M xiang.elec@gmail.com qsub-run.sh
    # wait for the job to finish
    qsub -sync y job${UT_CURR_INDEX}

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
