#!/usr/bin/env bash
set -u
set -x 

if [ $# -lt 1 ]; then
    echo "Usgae ./auto.sh trail"
    exit 2
fi

pf=1
trial=$1
test_limit=25
design_array=("mm3" "ode" "syn2" "dscg" "fir" "bfly")
mode_array=("online" "offline" "hybrid" "baseline")

for mode in "${mode_array[@]}"; do
    for design in "${design_array[@]}" ; do
        for i in `seq 1 $trial`; do
            echo "Start Trail $i"

            # searching with offline and online data
            if [ "$mode" == "hybrid" ]; then 
                ut clean; 
                ut quartus.py ${design} -lm xgbregressor -td data/${design}_LUT.csv -pf ${pf} --test-limit ${test_limit} 

            # searching with pure online data
            elif [ "$mode" == "online" ]; then
                ut clean; 
                ut quartus.py ${design} -lm xgbregressor -pf ${pf} --test-limit ${test_limit};

            # searching with pure offline data
            elif [ "$mode" == "offline" ]; then 
                ut clean; 
                ut quartus.py ${design} -lm xgbregressor -td data/${design}_LUT.csv -pf ${pf} --test-limit ${test_limit} -offline;

            # baseline 
            else
                ut clean; 
                ut quartus.py ${design} -pf ${pf} --test-limit ${test_limit}
            fi
            cp archive.csv results/${design}-${mode}-${i}.csv
            rm archive.csv
        done;
    done;
done
