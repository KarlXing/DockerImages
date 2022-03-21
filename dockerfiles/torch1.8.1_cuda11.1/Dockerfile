FROM pytorch/pytorch:1.8.1-cuda11.1-cudnn8-devel

# install some basic utilities
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    sudo \
    git \
    bzip2 \
    libx11-6 \
    tmux \
    zip \
    vim \
    wget \
    unzip \
    libosmesa6-dev \
    libgl1-mesa-glx \
    libglfw3 \
    libglew2.0 \
    libgtk2.0-dev

# install mujoco_py
RUN cd ~ \
 && mkdir .mujoco \
 && cd .mujoco \
 && wget https://roboti.us/download/mujoco200_linux.zip \
 && unzip mujoco200_linux.zip \
 && rm mujoco200_linux.zip \
 && mv mujoco200_linux  mujoco200 \
 && wget https://roboti.us/file/mjkey.txt \
 && export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/root/.mujoco/mujoco200/bin \ 
 && echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/root/.mujoco/mujoco200/bin' >> ~/.bashrc \
 && ln -s /usr/lib/x86_64-linux-gnu/libGL.so.1 /usr/lib/x86_64-linux-gnu/libGL.so \
 && pip install 'mujoco-py<2.1,>=2.0' \
 && echo 'export MUJOCO_PY_MUJOCO_PATH=/root/.mujoco/mujoco200' >> ~/.bashrc \
 && echo 'export MUJOCO_PY_MJKEY_PATH=/root/.mujoco/mjkey.txt' >> ~/.bashrc 

ENV MUJOCO_PY_MUJOCO_PATH /root/.mujoco/mujoco200
ENV MUJOCO_PY_MJKEY_PATH /root/.mujoco/mjkey.txt

# install other rl games
RUN pip install Box2D \
 && pip install pybullet==3.2.0 \
 && pip install procgen==0.10.4

# post install/upgrade
RUN pip install --upgrade numpy \
 && pip install pyrender


# drqv2 conda env
SHELL ["/bin/bash", "-c"]
COPY conda_env.yml  .
RUN conda env create -f conda_env.yml

RUN ["/bin/bash", "-c", "conda init bash"]

RUN echo "conda activate drqv2" > ~/.bashrc
