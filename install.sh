#!/bin/bash
cmake .
make -j8
cd python
python setup.py develop
