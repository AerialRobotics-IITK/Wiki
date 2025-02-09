# ArduPilot Setup on Docker

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
# Ardupilot Setup
RUN git clone --recurse-submodules https://github.com/ArduPilot/ardupilot.git /home/${USER}/ardupilot && \
    chmod +x /home/${USER}/ardupilot/Tools/environment_install/install-prereqs-ubuntu.sh && \
    sed -i "s/sudo //g" /home/${USER}/ardupilot/Tools/environment_install/install-prereqs-ubuntu.sh && \
    sed -i "s/exit 1//g" /home/${USER}/ardupilot/Tools/environment_install/install-prereqs-ubuntu.sh && \
    /home/${USER}/ardupilot/Tools/environment_install/install-prereqs-ubuntu.sh -y

# Install Python packages
RUN apt-get install -y --reinstall libssl-dev && \
    rm -rf /usr/lib/python3/dist-packages/OpenSSL /usr/lib/python3/pyOpenSSL-19.0.0.egg-info && \
    pip install flask flask-ask-sdk ask-sdk && \
    pip install --upgrade pymavlink MAVProxy && \
    pip3 install kconfiglib pyserial && \
    pip3 install --user empy && \
    pip3 install --user toml && \
    pip3 install --user numpy && \
    pip3 install --user pandas && \
    pip3 install --user jinja2 && \
    pip3 install --user pyyaml pyros-genmsg packaging

# Edit .bashrc
RUN echo '#! /bin/bash' >> /home/${USER}/.bashrc && \
    echo 'source /opt/ros/noetic/setup.bash' >> /home/${USER}/.bashrc && \
    echo 'source /usr/share/gazebo/setup.sh' >> /home/${USER}/.bashrc && \
    echo 'export GAZEBO_MODEL_PATH=~/ardupilot_gazebo/models' >> /home/${USER}/.bashrc && \
    echo 'export GAZEBO_RESOURCE_PATH=~/ardupilot_gazebo/worlds:${GAZEBO_RESOURCE_PATH}' >> /home/${USER}/.bashrc && \
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

* Copy **.bashrc** of _root_ user to _ariitk_ user
* Copy **/root/.ardupilot\_env** to **/user/ariitk/.ardupilot\_env**
* Append **export PATH=$PATH:/root/.local/bin/** to _root_ user's **.bashrc**
* MAVROS Setup

```bash
mkdir -p ardupilot_ws/src
cd ardupilot_ws/
catkin init 
cd src/
mkdir launch
roscp mavros apm.launch apm.launch
```

After this, edit **apm.launch** such that it uses a Network Port instead of Physical Port

```xml
<arg name="fcu_url" default="tcp://127.0.0.1:2626" />
```

Full File should look something like this

```xml
<launch>
	<!-- vim: set ft=xml noet : -->
	<!-- example launch script for ArduPilot based FCU's -->

	<arg name="fcu_url" default="tcp://127.0.0.1:2626" />
	<arg name="gcs_url" default="" />
	<arg name="tgt_system" default="1" />
	<arg name="tgt_component" default="1" />
	<arg name="log_output" default="screen" />
	<arg name="fcu_protocol" default="v2.0" />
	<arg name="respawn_mavros" default="false" />

	<include file="$(find mavros)/launch/node.launch">
		<arg name="pluginlists_yaml" value="$(find mavros)/launch/apm_pluginlists.yaml" />
		<arg name="config_yaml" value="$(find mavros)/launch/apm_config.yaml" />

		<arg name="fcu_url" value="$(arg fcu_url)" />
		<arg name="gcs_url" value="$(arg gcs_url)" />
		<arg name="tgt_system" value="$(arg tgt_system)" />
		<arg name="tgt_component" value="$(arg tgt_component)" />
		<arg name="log_output" value="$(arg log_output)" />
		<arg name="fcu_protocol" value="$(arg fcu_protocol)" />
		<arg name="respawn_mavros" value="$(arg respawn_mavros)" />
	</include>
</launch>
```

* Setup ArduPilot Gazebo

```bash
cd ~
git clone https://github.com/khancyr/ardupilot_gazebo.git 
cd ardupilot_gazebo/
mkdir build 
cd build/
cmake ..
make -j4
sudo make install
```

Note: You've to run ArduPilot as _root_ User\
At the end, the **.bashrc** file of _ariitk_ user should Look something like this:

```bash
source /opt/ros/noetic/setup.bash
source /usr/share/gazebo/setup.sh
export GAZEBO_MODEL_PATH=~/ardupilot_gazebo/models
export GAZEBO_RESOURCE_PATH=~/ardupilot_gazebo/worlds:${GAZEBO_RESOURCE_PATH}
export PATH=/usr/lib/ccache:$PATH
source /home/ariitk/ardupilot/Tools/completion/completion.bash
source ~/.ardupilot_env
source /usr/share/gazebo/setup.sh
```

And **.ardupilot.env** like

```bash
export PATH=/opt/gcc-arm-none-eabi-10-2020-q4-major/bin:$PATH
export PATH=/home/ariitk/ardupilot/Tools/autotest:$PATH
export PATH=/usr/lib/ccache:$PATH
```

#### Test the Docker Container

To test the Successful Setup of Docker Container, run the following commands in different Terminals (in order)

```bash
roscore
gazebo --verbose ~/ardupilot_gazebo/worlds/iris_arducopter_runway.world
sim_vehicle.py -v ArduCopter -f gazebo-iris --console --map --out=tcpin:127.0.0.1:2626 # It should be run as root and the Network Address in --out should be the same that was edited in apm.launch
roslaunch apm.launch
```

You should see a Drone in the Middle of a Runway.\
To Test MAVROS and MAVPROXY. You can ARM the drone.\
List the ROS Topics and Services with the following commands.

```bash
rostopic list
rosservice list
```

ARM the Drone with the Following Service Call

```bash
rosservice call /mavros/cmd/arming true
```

#### Save the Initial Changes

To save the Initial Changes make an image of the container

```bash
docker commit ariitk ariitk/ardupilot
```

#### Export Docker Image

To export a docker Image, type the following command

```bash
docker save -o <filename>.tar ariitk/ardupilot
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
