# Raspberry Pi 4B Setup

Setting up a Raspi Onboard companion computer from scratch without a mouse and keys (making rocks sophisticated with bare hands). Keep a microSD card ready. We are using Ubuntu 20.04 Server Image. Simulation software are not needed and also won't work in this OS.

## Flashing OS on the board

Install "rpi-imager"

```bash
sudo apt install rpi-imager
```

Start the Raspberry Pi Imager. Put your microSD card into your computer.

On the Raspberry Pi Imager, click on “Choose OS”. Navigate to your preferred OS(Ubuntu 20.04 Server image).

Also, click on “Choose Storage” and you should find your microSD card.

The configuration is not complete, do not click on “Write” yet.

Instead, click on the settings icon.

Then, here are the settings you need to enable:

* “Enable SSH” to enable SSH.
* “Set username”. For the username you can choose whatever you want, I will use “pi” for the following of this tutorial. You also need to choose a password.
* “Configure wireless LAN”. This will enable the Wi-Fi and automatically connect to the network + password you provide. Of course, this Wi-Fi network should be the same as the one your computer is currently connected to, otherwise, the rest of this tutorial won’t work.

(a few moments later 0\_0)

Put the SD card into the Board. Check the LED status of the board to see if it is booting from the card, otherwise, format the card and try again.

## Setup Ubuntu Server Image for ARIITK

* Basic Linux Setup

```bash
sudo apt-get update
sudo apt-get upgrade
timedatectl set-local-rtc 1 --adjust-system-clock
sudo apt-get install git
```

* ROS Setup

```bash
# setup sources.list
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# setup keys
sudo apt install curl # if you haven't already installed curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

# installation
sudo apt update
sudo apt install ros-noetic-base

#initialize rosdep
sudo apt install python3-rosdep #if you have not yet installed rosdep,run this line otherwise skip
sudo rosdep init
rosdep update

# setup environment
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
source ~/.bashrc

# fulfill dependencies
sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential
```

* Setup MAVROS for communicating to ROS via MAVlink protocol

```bash
# install some dependencies
sudo apt install python3-rosinstall python3-rosinstall-generator python3-wstool build-essential

# install MAVROS
sudo apt-get install ros-noetic-mavros ros-noetic-mavros-extras

cd ~/

wget https://raw.githubusercontent.com/mavlink/mavros/master/mavros/scripts/install_geographiclib_datasets.sh

sudo chmod a+x install_geographiclib_datasets.sh

sudo ./install_geographiclib_datasets.sh

# Install catkin tools
sudo apt-get install python3-catkin-tools

# Updating MAVProxy and pymavlink (new versions released now and then)
sudo pip install --upgrade pymavlink MAVProxy

#Setup MAVROS to begin communication
cd ~/

mkdir -p ardupilot_ws/src

cd ardupilot_ws

catkin init

cd src

mkdir launch

cd launch

roscp mavros apm.launch apm.launch

sudo gedit apm.launch #opens a text editor, follow the next command (you can also do it using any other editor of your choice, for eg. by using 'code' commmand)

#To proxy to a Ground Control Station like QGC or Mission Planner on ground we just need to modify the first line to <arg name="fcu_url" default="udp://:{ground-port}@{ground-hostname}" />. save you file and launch it with-

cd ~/ardupilot_ws/src/launch

roslaunch apm.launch

```

* QGC Setup for proxy via MAVROS (set the ground-port and ground-hostname here)

Open QGC > Go to 'Application Settings' > Go to 'Comm Links' tab from side menu > Click 'Add' in options menu below > Select 'Type' as 'UDP' > Type {ground-port} in

"Port" and {ground-hostname} in "Server Addresses (optional)" > Click "OK" > Click on "Connect" tab from side menu

**MAKE SURE YOUR BOARD AND GROUND STATION ARE CONNECTED TO THE SAME LAN SETUP VIA A ROUTER FOR PROXY TO WORK**
