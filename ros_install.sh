# This is bash script to download ROS and its dependencies

sudo apt-get update

echo "setting up sources list for ROS and the keys"

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

echo "done"

sudo apt-get update

echo "Installing desktop full version"

sudo apt-get install ros-kinetic-desktop-full

echo "ROS installed"

echo "Hold on more to go"

sudo rosdep init
rosdep update

echo "setting up environment"

echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
source ~/.bashrc

echo "source /opt/ros/kinetic/setup.zsh" >> ~/.zshrc
source ~/.zshrc

sudo apt install python-rosinstall python-rosinstall-generator python-wstool build-essential

sudo apt-get install ros-kinetic-mavros

sudo apt-get install ros-kinetic-mavros-extras

sudo apt-get install ros-kinetic-mavlink

