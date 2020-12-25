#!/bin/bash
#PBS -l select=1:ncpus=12 -q xeon

# Change directry to workdir/thread
cd $path

DESIGN="gemm"
MODE="FULL"
if [ $# -gt 0 ]; then
    MODE=$1
fi

source /export/fpga/bin/setup-fpga-env fpga-pac-a10
if [ $MODE == "EMU" ]; then
    echo "Compiling in emulator mode..."
    aoc -march=emulator -board=pac_a10 -time time.out -time-passes -regtest_mode -v -fpc -fp-relaxed -opt-arg -nocaching -report "$DESIGN".cl
    # aoc -march=emulator -board=pac_s10_dc -time time.out -time-passes -regtest_mode -v -fpc -fp-relaxed -opt-arg -nocaching -report "$DESIGN".cl
elif [ $MODE == "CLEAN" ]; then 
    echo "Cleaning tmp files..."
    rm -rf *.aoc* time.out gemm
else
    echo "Compiling in bitstream mode..."
    echo `which python`
    echo "current path: $path"
    aoc -board=pac_a10 -time time.out -time-passes -regtest_mode -v -fpc -fp-relaxed -opt-arg -nocaching -report "$DESIGN".cl
    # aoc -board=pac_s10_dc -time time.out -time-passes -regtest_mode -v -fpc -fp-relaxed -opt-arg -nocaching -report "$DESIGN".cl
fi
