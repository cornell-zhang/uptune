if [ $# -lt 1 ]; then
echo "Usgae ./auto.sh trail"
exit 2
fi

TRIAL=$1
design_array=("ode" "bfly") #("mm3" "ode" "syn2" "dscg" "fir" "bfly")
mode_array=("online" "hybrid")

for mode in "${mode_array[@]}"; do
    for design in "${design_array[@]}" ; do
        for i in `seq 1 $TRIAL`; do
            echo "Start Trail $i"
            if [ "$mode" = "online" ]; then
                uptune clean; uptune lambda.py ${design} -lm xgbregressor -td data/${design}_LUT.csv -pf 1 --test-limit 25
            else # pure offline
                uptune clean; uptune lambda.py ${design} -lm xgbregressor -td data/${design}_LUT.csv -pf 1 --test-limit 25 -offline
            fi
            cp -f global.db results/${design}-${mode}-${i}.db
        done;
    done;
done
