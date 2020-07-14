#!/bin/bash

# adjust the Python versions you would like to build
array=( 3.5 3.6 3.7 3.8)

echo "Building conda package ..."
conda config --add channels conda-forge
conda config --add channels bioconda

# building conda packages
for i in "${array[@]}"
do
    conda-build --python $i -c conda-forge .
done

CONDA_PATH=$HOME/anaconda3
# convert package to other platforms
platforms=( osx-64 linux-32 linux-64 win-32 win-64 )
find $CONDA_PATH/conda-bld/linux-64/ -name *.tar.bz2 | while read file
do
    echo $file
    # conda convert --platform all $file  -o $HOME/conda-bld/
    for platform in "${platforms[@]}"
    do
       conda convert --platform $platform $file  -o $CONDA_PATH/conda-bld/
    done    
done

# upload packages to conda
find $CONDA_PATH/conda-bld/ -name *.tar.bz2 | while read file
do
    echo $file
    anaconda upload $file
done
echo "Building conda package done!"
