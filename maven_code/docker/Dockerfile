# FROM nvidia/cuda:9.2-cudnn7-devel-ubuntu18.04
FROM nvidia/cuda:8.0-cudnn7-devel-ubuntu16.04

# CUDA includes
ENV CUDA_PATH /usr/local/cuda
ENV CUDA_INCLUDE_PATH /usr/local/cuda/include
ENV CUDA_LIBRARY_PATH /usr/local/cuda/lib64

# Ubuntu Packages
RUN apt-get update -y && apt-get install software-properties-common -y && \
    add-apt-repository -y multiverse && apt-get update -y && apt-get upgrade -y && \
    apt-get install -y apt-utils nano vim man build-essential wget sudo && \
    rm -rf /var/lib/apt/lists/*

# Install curl and other dependencies
RUN apt-get update -y && apt-get install -y curl libssl-dev openssl libopenblas-dev \
    libhdf5-dev hdf5-helpers hdf5-tools libhdf5-serial-dev libprotobuf-dev protobuf-compiler && \
    curl -sk https://raw.githubusercontent.com/torch/distro/master/install-deps | bash && \
    rm -rf /var/lib/apt/lists/*


#Install python3 pip3
RUN apt-get update
RUN apt-get -y install python3
RUN apt-get -y install python3-pip
RUN pip3 install --upgrade pip
RUN pip3 install numpy scipy pyyaml matplotlib
RUN pip3 install imageio pygame
RUN pip3 install tensorboard-logger
RUN pip3 install ruamel.base ryd

RUN mkdir /install
WORKDIR /install

# install Sacred 
RUN pip3 install setuptools
RUN git clone https://github.com/oxwhirl/sacred.git /install/sacred && cd /install/sacred && python3 setup.py install

# Install pymongo
RUN pip3 install pymongo

#### -------------------------------------------------------------------
#### install pytorch
#### -------------------------------------------------------------------
# RUN pip3 install torch==1.4.0+cu92 torchvision==0.5.0+cu92 -f https://download.pytorch.org/whl/torch_stable.html
RUN pip3 install torch==1.4.0 torchvision==0.5.0
RUN pip3 install snakeviz pytest probscale

# Dependencies for gfootball (from google dockerfile)
RUN apt-get update && apt-get install -yq git cmake build-essential \
  libgl1-mesa-dev libsdl2-dev \
  libsdl2-image-dev libsdl2-ttf-dev libsdl2-gfx-dev libboost-all-dev \
  libdirectfb-dev libst-dev mesa-utils xvfb x11vnc \
  libsdl-sge-dev python3-pip

## -- gfootball
RUN pip3 install tensorflow==1.15rc2 dm-sonnet psutil
RUN pip3 install git+https://github.com/openai/baselines.git@master

RUN sed -i 's|-L${SDL2_LIBDIR}  -lSDL2 |-L${SDL2_LIBDIR}  -lSDL2|g' /usr/lib/x86_64-linux-gnu/cmake/SDL2/sdl2-config.cmake

RUN pip3 install git+https://github.com/conglu1997/football.git@new_version_2

WORKDIR /pymarl
