---
description: How to install ROS.
---

# ROS Setup

Robot Operating System (ROS) is robotics middleware. Although it is not an operating system, it provides services designed for a heterogeneous computer cluster such as hardware abstraction, low-level device control, implementation of commonly used functionality, message-passing between processes, and package management.

{% embed url="http://www.ros.org" %}

{% hint style="info" %}
This installation will install ROS Noetic on the system.

* Requires Ubuntu 20.04 LTS
{% endhint %}

To install ROS, open the terminal and run the following:

{% tabs %}
{% tab title="bash setup" %}
````bash
# setup sources.list
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# setup keys
sudo apt install curl # if you haven't already installed curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

# installation
sudo apt update
sudo apt install ros-noetic-desktop-full

#initialize rosdep
sudo apt install python3-rosdep #if you have not yet installed rosdep,run this line otherwise skip
sudo rosdep init
rosdep update

# setup environment
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
source ~/.bashrc

# fulfill dependencies
sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential  ```

</div>

<div data-gb-custom-block data-tag="tab" data-title='zsh setup'>

```text
# setup sources.list
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# setup keys
sudo apt install curl # if you haven't already installed curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

# installation
sudo apt update
sudo apt install ros-noetic-desktop-full

# minimal installation for microcontrollers 
sudo apt install ros-noetic-ros-base  # skip this if ros-noetic-desktop version is being installed

# install a specific package
sudo apt install ros-noetic-PACKAGE # e.g sudo apt install ros-noetic-slam-gmapping

#initialize rosdep
sudo apt install python3-rosdep #if you have not yet installed rosdep,run this line otherwise skip
sudo rosdep init
rosdep update

# setup environment
echo "source /opt/ros/noetic/setup.bash" >> ~/.zshrc
source ~/.zshrc

# fulfill dependencies
sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential

# single liner installation for gazebo
curl -sSL http://get.gazebosim.org | sh

# single liner installation for meshlab
sudo apt -y install meshlab
````
{% endtab %}
{% endtabs %}

{% hint style="warning" %}
If the above install fails, follow the instructions given here:
{% endhint %}

{% embed url="https://wiki.ros.org/noetic/Installation/Ubuntu​" %}
