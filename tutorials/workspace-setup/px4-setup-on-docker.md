# PX4 Setup on Docker

### Building Docker Container

#### Pull the Docker Image

Image Used: _osrf/ros:noetic-desktop-full_

```bash
docker pull osrf/ros:noetic-desktop-full
```

#### Dockerfile for Building Docker Image

Make your Workspace Directory and paste the Following in the **DockerFile**

```dockerfile
# Use the base image for ROS Noetic Desktop
FROM osrf/ros:noetic-desktop-full

# Set build arguments
ARG USER=ariitk
ARG DEBIAN_FRONTEND=noninteractive

RUN groupadd -r ${USER} && useradd -r -g ${USER} ${USER} && \
    mkdir -p /home/${USER} && \
    chown -R ${USER}:${USER} /home/${USER} && \
    echo ${USER}' ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers && \
    chmod 0440 /etc/sudoers

# Set the working directory
WORKDIR /home/${USER}

# Update package lists and install required ROS packages and tools
RUN apt-get update && \
    apt-get install -y \
    ros-noetic-moveit \
    ros-noetic-ros-controllers \
    ros-noetic-gazebo-ros-control \
    ros-noetic-rosserial \
    ros-noetic-rosserial-arduino \
    ros-noetic-roboticsgroup-upatras-gazebo-plugins \
    ros-noetic-actionlib-tools \
    ros-noetic-rqt \
    ros-noetic-rqt-common-plugins \
    ros-noetic-rqt-robot-plugins \
    terminator \
    python \
    python3 \
    python3-pip \
    python3-rosdep \
    python3-rosinstall \
    python3-rosinstall-generator \
    python3-wstool \
    python3-catkin-tools \
    build-essential \
    libgstreamer-plugins-base1.0-dev \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-ugly \
    libprotobuf-dev \
    libprotoc-dev \
    protobuf-compiler \
    libeigen3-dev \
    libxml2-utils \
    python3-rospkg \
    python3-jinja2 \
    ros-noetic-mavros \
    ros-noetic-mavros-extras \
    ros-noetic-mavlink \
    nano \
    git \
    vim && \
    rm -rf /var/lib/apt/lists/*
# Install Gazebo & Meshlab
RUN curl -sSL http://get.gazebosim.org | sh && \
    apt-get install -y gazebo11 \
    meshlab
# PX4 Install Script
RUN wget https://raw.githubusercontent.com/PX4/PX4-Autopilot/refs/heads/main/Tools/setup/ubuntu.sh && \
    wget https://raw.githubusercontent.com/PX4/PX4-Autopilot/refs/heads/main/Tools/setup/requirements.txt && \
    chmod +x ubuntu.sh && \
    ./ubuntu.sh && \
    rm ubuntu.sh && \
    rm requirements.txt
# Install MAVROS
RUN apt-get install -y ros-noetic-mavros \
    ros-noetic-mavros-extras && \
    wget https://raw.githubusercontent.com/mavlink/mavros/master/mavros/scripts/install_geographiclib_datasets.sh && \
    chmod +x install_geographiclib_datasets.sh && \
    ./install_geographiclib_datasets.sh && \
    rm install_geographiclib_datasets.sh

# Install Python packages
RUN apt-get install -y --reinstall libssl-dev && \
    rm -rf /usr/lib/python3/dist-packages/OpenSSL /usr/lib/python3/pyOpenSSL-19.0.0.egg-info && \
    pip install --upgrade pymavlink MAVProxy && \
    pip3 install kconfiglib pyserial future && \
    pip3 install --user empy && \
    pip3 install --user toml && \
    pip3 install --user numpy && \
    pip3 install --user pandas && \
    pip3 install --user jinja2 && \
    pip3 install --user jsonschema && \
    pip3 install --user pyyaml pyros-genmsg packaging

# Edit .bashrc
RUN echo '#! /bin/bash' >> /home/${USER}/.bashrc && \
    echo 'source /opt/ros/noetic/setup.bash' >> /home/${USER}/.bashrc && \
    echo 'source /usr/share/gazebo/setup.sh' >> /home/${USER}/.bashrc && \
    echo 'export PATH=/usr/lib/ccache:$PATH' >> /home/${USER}/.bashrc && \
    echo 'export GAZEBO_PLUGIN_PATH=/usr/lib/x86_64-linux-gnu/gazebo-11/plugins:$GAZEBO_PLUGIN_PATH ' && \
    echo 'export GAZEBO_PLUGIN_PATH=/opt/ros/noetic/lib:$GAZEBO_PLUGIN_PATH'

# Switch to the specified user
USER ${USER}
```

#### Build Docker Image

Docker Image name: _ariitk_

```bash
docker build -t ariitk .
```

#### Make a Shared Directory between Host & Docker Container

Shared Directory Path: _\~/Docker/Shared-Volumes/ariitk-Container_

```bash
mkdir -p ~/Docker/Shared-Volumes/ariitk-Container
```

Note: You can use any of your directory for this

#### Running the Docker Container

Container Name: _ariitk_

```bash
sudo docker run -d -it --rm -v ~/Docker/Shared-Volumes/ariitk-Container:/home/Shared-Volume/ -v /tmp/.X11-unix/:/tmp/.X11-unix --net host --env="$(env | grep DISPLAY)" --name ariitk ariitk
```

Provide Permission to DISPLAY for Docker

```bash
xhost +local:docker
```

If you've problem in running the GUI Applications in the Container try the following methods:

* Make sure that output of env | grep DISPLAY should contain 1 line and should look like this: **DISPLAY=:1**. If not then, manually feed the DISPLAY value in the run command. For example **sudo docker run -d -it --rm -v \~/Docker/Shared-Volumes/ariitk-Container:/home/Shared-Volume/ -v /tmp/.X11-unix/:/tmp/.X11-unix --net host --env="**_**DISPLAY=:1**_**" --name ariitk \<image\_name/image\_id>**
* If error = **libGL error: MESA-LOADER: failed to retrieve device information**. Add this parameter this in docker run : **-e LIBGL\_ALWAYS\_SOFTWARE=1** and install the required libraries.

Note: We've provided _**--rm**_ argument, so do all the work in the shared directory. Because all the data outside shared directory would be deleted as soon as the container is stopped. And in order to save any changes in the docker container, use docker commit to create a new version for the changes

#### Attach to Docker Container

Shell used: _bash_

```bash
docker exec -it ariitk /bin/bash
```

#### Initial Setup Inside the Container

* Install Python Dependencies

```bash
pip3 install future kconfiglib 
pip3 install --user jsonschema 
```

* PX4-AutoPilot Setup

```bash
cd ~
git clone https://github.com/PX4/PX4-Autopilot --recursive
cd ~/PX4-Autopilot/
make px4_sitl_default gazebo_iris 
```

* Install MAVROS

```bash
mkdir -p ~/catkin_ws/src/
cd ~/catkin_ws/
catkin init 
wstool init src 
rosinstall_generator --rosdistro ${ROS_DISTRO} mavlink | tee /tmp/mavros.rosinstall 
rosinstall_generator --upstream mavros | tee -a /tmp/mavros.rosinstall 
wstool merge -t src /tmp/mavros.rosinstall 
wstool update -t src -j4 
rosdep update 
rosdep install --from-paths src --ignore-src -y 
sudo ./src/mavros/mavros/scripts/install_geographiclib_datasets.sh 
catkin build 
```

* The **.bashrc** should look like this

```bash
source /opt/ros/noetic/setup.bash
source /usr/share/gazebo/setup.sh
export PATH=/usr/lib/ccache:$PATH
source ~/catkin_ws/devel/setup.bash
source ~/PX4-Autopilot/Tools/simulation/gazebo-classic/setup_gazebo.bash ~/PX4-Autopilot ~/PX4-Autopilot/build/px4_sitl_default >/dev/null 2>/dev/null
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:~/PX4-Autopilot
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:~/PX4-Autopilot/Tools/simulation/gazebo-classic/sitl_gazebo-classic
export GAZEBO_PLUGIN_PATH=$GAZEBO_PLUGIN_PATH:/usr/lib/x86_64-linux-gnu/gazebo-11/plugins
```

#### Test the Docker Container

To test the Successful Setup of Docker Container, run the following commands in different Terminals (in order)

```bash
roscore
cd ~/PX4-Autopilot/ && make px4_sitl_default gazebo_iris 
roslaunch mavros px4.launch fcu_url:=udp://:14540@localhost:14557 
```

Note: If the **mavros** command fails, free some resources (CPU & RAM) on your PC & Try again in 1 minute. And repeat this setup until it stops crashing.\
You should see a Drone in the Ground.\
To Test MAVROS and MAVPROXY. You can ARM the drone.\
List the ROS Topics and Services with the following commands.

```bash
rostopic list
rosservice list
```

#### Save the Initial Changes

To save the Initial Changes make an image of the container

```bash
docker commit ariitk ariitk/px4
```

#### Export Docker Image

To export a docker Image, type the following command

```bash
docker save -o <filename>.tar ariitk/px4
```

### Using Docker Image

#### Import Docker Image

To import a docker image, type the following command

```bash
docker load -i <filename>.tar
```

You can then tag the import image with the following command

```bash
docker tag <image_id> my_custom_image:latest
```

You can find the image\_id with the following command

```bash
docker image list
```

#### Make a Shared Directory between Host & Docker Container

Shared Directory Path: _\~/Docker/Shared-Volumes/ariitk-Container_

```bash
mkdir -p ~/Docker/Shared-Volumes/ariitk-Container
```

#### Run Docker Image

Container Name: _ariitk_

```bash
sudo docker run -d -it --rm -v ~/Docker/Shared-Volumes/ariitk-Container:/home/Shared-Volume/ -v /tmp/.X11-unix/:/tmp/.X11-unix --net host --env="$(env | grep DISPLAY)" --name ariitk <image_name/image_id>
```

Provide Permission to DISPLAY for Docker

```bash
xhost +local:docker
```

If you've problem in running the GUI Applications in the Container try the following methods:

* Make sure that output of env | grep DISPLAY should contain 1 line and should look like this: **DISPLAY=:1**. If not then, manually feed the DISPLAY value in the run command. For example **sudo docker run -d -it --rm -v \~/Docker/Shared-Volumes/ariitk-Container:/home/Shared-Volume/ -v /tmp/.X11-unix/:/tmp/.X11-unix --net host --env="**_**DISPLAY=:1**_**" --name ariitk \<image\_name/image\_id>**
* If error = **libGL error: MESA-LOADER: failed to retrieve device information**. Add this parameter this in docker run : **-e LIBGL\_ALWAYS\_SOFTWARE=1** and install the required libraries.

Note: We've provided _**--rm**_ argument, so do all the work in the shared directory. Because all the data outside shared directory would be deleted as soon as the container is stopped. And in order to save any changes in the docker container, use docker commit to create a new version for the changes

#### Attach to Docker Container

Shell used: _bash_

```bash
docker exec -it ariitk /bin/bash
```
