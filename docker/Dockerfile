FROM ubuntu:18.04
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update --fix-missing

# install libraries for building c++ core on ubuntu
RUN apt-get update && apt-get install -y --no-install-recommends \
        git make cmake wget curl unzip libtinfo-dev bzip2 sudo binutils g++ \
        ca-certificates libgtest-dev tk-dev libx11-dev && rm -r /var/lib/apt/lists/*

# install gtest 
RUN cd /usr/src/gtest && sudo mkdir build && cd build \
    sudo cmake .. && sudo make && sudo make install

# install anaconda
RUN wget \
    https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    --no-check-certificate && \
    chmod u+x Miniconda3-latest-Linux-x86_64.sh && \
    bash Miniconda3-latest-Linux-x86_64.sh -b -p /opt/conda && \
    rm -f Miniconda3-latest-Linux-x86_64.sh && \ 
    /opt/conda/bin/conda upgrade --all && \
    /opt/conda/bin/conda install conda-build conda-verify && \
    /opt/conda/bin/conda clean -ya

RUN /opt/conda/bin/conda create -n uptune pytest future python=3.7
ENV PATH /opt/conda/bin:$PATH
ENV CONDA_BLD_PATH /tmp
SHELL ["conda", "run", "-n", "uptune", "/bin/bash", "-c"]

# install uptune
RUN cd /usr && \
    git config --global http.sslVerify false && \
    git clone https://github.com/cornell-zhang/uptune.git --recursive && \
    cd /usr/uptune && \
    ./install.sh
