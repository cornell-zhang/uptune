#!/bin/bash
#PBS -l select=1:ncpus=12 -q fpga-pac-s10

# Change directry to workdir/thread
cd $path

MODE="FULL"
if [ $# -gt 0 ]; then
    MODE=$1
fi

source /export/fpga/bin/setup-fpga-env fpga-pac-s10
if [ $MODE == "EMU" ]; then
    echo "Compiling in emulator mode..."
    # aoc -march=emulator -board=pac_a10 -time time.out -time-passes -regtest_mode -v -fpc -fp-relaxed -opt-arg -nocaching -report gemm.cl
    aoc -march=emulator -board=pac_s10_dc -time time.out -time-passes -regtest_mode -v -fpc -fp-relaxed -opt-arg -nocaching -report jpeg_decoder.cl
elif [ $MODE == "CLEAN" ]; then 
    echo "Cleaning tmp files..."
    rm -rf *.aoc* time.out gemm
else
    echo "Compiling in bitstream mode..."
    echo `which python`
    echo "current path: $path"
    # aoc -board=pac_a10 -time time.out -time-passes -regtest_mode -v -fpc -fp-relaxed -opt-arg -nocaching -report gemm.cl
    aoc -board=pac_s10_dc -time time.out -time-passes -regtest_mode -v -fpc -fp-relaxed -opt-arg -nocaching -report jpeg_decoder.cl
fi
