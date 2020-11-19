#!/bin/bash
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