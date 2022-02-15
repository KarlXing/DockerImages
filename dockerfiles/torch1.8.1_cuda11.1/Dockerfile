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
 && wget https://mujoco.org/download/mujoco210-linux-x86_64.tar.gz \
 && tar -xf mujoco210-linux-x86_64.tar.gz \
 && export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/root/.mujoco/mujoco210/bin \ 
 && echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/root/.mujoco/mujoco210/bin' >> ~/.bashrc \
 && ln -s /usr/lib/x86_64-linux-gnu/libGL.so.1 /usr/lib/x86_64-linux-gnu/libGL.so \
 && pip install --upgrade pip \
 && pip install 'mujoco-py<2.2,>=2.1'


# install gym==0.20.0
RUN pip install gym==0.21.0

# install dm_control
RUN cd ~/.mujoco \
 && wget https://github.com/deepmind/mujoco/releases/download/2.1.1/mujoco-2.1.1-linux-x86_64.tar.gz \
 && tar -xf mujoco-2.1.1-linux-x86_64.tar.gz \
 && pip install pyrender \
 && pip install dm_control
 
# install other rl games
RUN pip install Box2D \
 && pip install pybullet==3.2.0 \
 && pip install procgen==0.10.4

# post install/upgrade
RUN pip install --upgrade numpy \
 && pip install pyrender
