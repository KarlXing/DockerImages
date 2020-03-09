FROM nvidia/cuda:10.1-cudnn7-runtime-ubuntu16.04

# Install some basic utilities
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    sudo \
    git \
    bzip2 \
    libx11-6 \
    tmux \
    zip \
    unzip\
    vim \
    wget \
    cmake \
    g++ \
    gcc \
    mesa-common-dev \
    libgl1-mesa-glx \

 && rm -rf /var/lib/apt/lists/*


# Create a working directory
RUN mkdir /app
WORKDIR /app


# Install Miniconda
RUN curl -so ~/miniconda.sh https://repo.continuum.io/miniconda/Miniconda3-4.5.11-Linux-x86_64.sh \
 && chmod +x ~/miniconda.sh \
 && ~/miniconda.sh -b -p ~/miniconda \
 && rm ~/miniconda.sh
ENV PATH=~/miniconda/bin:$PATH
ENV CONDA_AUTO_UPDATE_CONDA=false