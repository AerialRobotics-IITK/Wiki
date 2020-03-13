---
description: How to install ROS.
---

# ROS Setup

Robot Operating System \(ROS\) is robotics middleware. Although it is not an operating system, it provides services designed for a heterogeneous computer cluster such as hardware abstraction, low-level device control, implementation of commonly used functionality, message-passing between processes, and package management.

{% embed url="http://www.ros.org" caption="" %}

{% hint style="info" %}
This installation will install ROS Kinetic on the system.

* Requires Ubuntu 16.04 LTS
{% endhint %}

To install ROS, open the terminal and run the following:

{% tabs %}
{% tab title="bash setup" %}
```bash
# setup sources.list
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# setup keys
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

# installation
sudo apt-get update
sudo apt-get install ros-kinetic-desktop-full

#initialize rosdep
sudo rosdep init
rosdep update

# setup environment
echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
source ~/.bashrc

# fulfill dependencies
sudo apt-get install python-rosinstall python-rosinstall-generator python-wstool build-essential
```
{% endtab %}

{% tab title="zsh setup" %}
```text
# setup sources.list
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# setup keys
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

# installation
sudo apt-get update
sudo apt-get install ros-kinetic-desktop-full

#initialize rosdep
sudo rosdep init
rosdep update

# setup environment
echo "source /opt/ros/kinetic/setup.bash" >> ~/.zshrc
source ~/.zshrc

# fulfill dependencies
sudo apt-get install python-rosinstall python-rosinstall-generator python-wstool build-essential
```
{% endtab %}
{% endtabs %}

{% hint style="warning" %}
If the above install fails, follow the instructions given here:
{% endhint %}

{% embed url="http://wiki.ros.org/kinetic/Installation/Ubuntu​" caption="" %}

