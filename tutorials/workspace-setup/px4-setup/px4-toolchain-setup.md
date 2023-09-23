---
description: Configuring the toolchain for PX4.
---

# PX4 Toolchain Setup

## Basic Toolchain <a href="#basic-toolchain" id="basic-toolchain"></a>

To download the PX4 Firmware, follow the steps shown below

```bash
sudo apt-get install python python3 python-pip python3-pip
sudo apt-get update
sudo apt-get upgrade
pip3 install kconfiglib
pip3 install pyserial 
pip3 install --user empy 
pip3 install --user toml 
pip3 install --user numpy 
pip3 install --user pandas 
pip3 install --user jinja2 
pip3 install --userpyyaml pyros-genmsg packaging  
sudo apt-get install libgstreamer-plugins-base1.0-dev gstreamer1.0-plugins-bad gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-ugly -y
sudo apt-get install libprotobuf-dev libprotoc-dev protobuf-compiler libeigen3-dev libxml2-utils python3-rospkg python3-jinja2
sudo apt-get install ros-noetic-mavros ros-noetic-mavros-extras ros-noetic-mavlink python3-catkin-tools python3-rosinstall-generator
wget https://raw.githubusercontent.com/mavlink/mavros/master/mavros/scripts/install_geographiclib_datasets.sh
sudo bash ./install_geographiclib_datasets.sh
```

After that:

```bash
cd ~
mkdir -p ros/firmware_ws/src
cd ros/firmware_ws
catkin init
cd src
git clone https://github.com/PX4/PX4-Autopilot.git --recursive
cd PX4-Autopilot
git checkout v1.11.3
```

Write the following in `.bashrc` (done by typing `code .bashrc` in the terminal):

```bash
source ~/ros/firmware_ws/src/PX4-Autopilot/Tools/setup_gazebo.bash ~/ros/firmware_ws/src/PX4-Autopilot ~/ros/firmware_ws/src/PX4-Autopilot/build/px4_sitl_default > /dev/null
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:~/ros/firmware_ws/src/PX4-Autopilot            
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:~/ros/firmware_ws/src/PX4-Autopilot/Tools/sitl_gazebo
```

Finally, if you have been successful, you should see a drone hovering in the middle of gazebo, upon typing:

```bash
roslaunch px4 mavros_posix_sitl.launch
```



> Do **NOT** use the convenience Bash scripts provided on the website

Follow the instructions at [PX4 Development Guide](https://dev.px4.io/en/setup/dev\_env\_linux\_ubuntu.html) for Linux (Ubuntu/Debian).

We'll be using **NuttX** based hardware, so **AVOID** Snapdragon Flight, Raspberry Pi and Parrot.

### Steps to follow: <a href="#steps-to-follow" id="steps-to-follow"></a>

* Permission Setup
* Remove the modemmanager
* Common dependencies
* Ninja build system
* FastRTPS installation
* Simulation Dependencies
