#!/bin/bash
set -x

# ssh to local machine
ssh $USER@$HOSTNAME "export VITIS=/work/shared/common/Xilinx/Vitis/2019.2; \
    source $VITIS/settings64.sh; \
    export XILINXD_LICENSE_FILE=2100@flex.ece.cornell.edu; \
    source /opt/xilinx/xrt/setup.sh; \
    cd $1; make build TARGET=hw DEVICE=$2 KERNEL=$3 TOP_FUNCTION=$4"
