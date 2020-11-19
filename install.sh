#!/bin/bash

set -e
set -x

UT_CXX_API=false
UT_CAUSAL_PKG=true

if $UT_CXX_API; then 
    rm -rf build
    mkdir build
    cd build
    cmake ..
    make -j4
    ./uptune_tests
    cd ../
fi

if $UT_CAUSAL_PKG; then 
    # conda install -c conda-forge libv8
    # conda install -c r r
    Rscript requirements.r 
fi 

# Install the python pkg
cd python
pip install ray --user
python setup.py develop --user
cd ../
