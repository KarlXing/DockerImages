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
    libglew2.0

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
 && ln -s /usr/lib/x86_64-linux-gnu/libGL.so.1 /usr/lib/x86_64-linux-gnu/libGL.so \
 && pip install 'mujoco-py<2.1,>=2.0'


# install gym==0.20.0
RUN pip install gym==0.20.0 \
&& pip install autorom[accept-rom-license] \
&& pip install ale_py==0.7.0 

# install dm_control
RUN cd ~/.mujoco \
 && wget https://mujoco.org/download/mujoco210-linux-x86_64.tar.gz \
 && tar -xvf mujoco210-linux-x86_64.tar.gz \
 && pip install pyrender \
 && pip install dm_control
 
# install other rl games
RUN pip install Box2D \
 && pip install pybullet==3.2.0 \
 && pip install procgen==0.10.4
