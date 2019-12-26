python bnn.py --save
python bnn.py --save --sec
python dense.py --save
python dense.py --save --sec

echo "Parse conv.cpp ."
python parser.py
python parser.py --sec
python parser_dense.py
python parser_dense.py --sec
cd conv
echo "Sleep for 15 seconds, and then start to build the program. (For clock skew detection.)"
sleep 15s
make

# diff hcl_conv_result.txt lab4_conv_result.txt
# if [ $? -ne 0 ];then
#     echo -e "Outputs don't match. \e[91m Fail. \e[0m"
# else
#     echo -e "Compare the result with lab4 conv layer: \e[92m PASS. \e[0m"
#     make vivado
# fi
make vivado

# echo -e "generate bistream"
# source run_bitstream.sh

cp -f ./bnn.prj/solution1/syn/report/dut_csynth.rpt ../
cp -f ./bnn.prj/solution1/syn/report/dut_csynth.xml ../
echo "clean workspace"
#make clean &>/dev/null
cd ..
rm hcl_code_generator
rm hcl_code_generator2
rm hcl_code_dense
rm hcl_code_dense2
echo -e "\e[92m Done. \e[0m"
