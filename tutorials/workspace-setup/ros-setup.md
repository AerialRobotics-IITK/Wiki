---
description: How to install ROS.
---

# ROS Setup

Robot Operating System \(ROS\) is robotics middleware. Although it is not an operating system, it provides services designed for a heterogeneous computer cluster such as hardware abstraction, low-level device control, implementation of commonly used functionality, message-passing between processes, and package management.
One needs an interface to interact with a system, and that's what ROS is for.

{% embed url="http://www.ros.org" caption="" %}

{% hint style="info" %}
This installation will install ROS Melodic on the system.

- Requires Ubuntu 18.04 LTS

{% endhint %}

To install ROS, open the terminal and run the following:

{% tabs %}
{% tab title="bash setup" %}

```bash
# setup sources.list
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# setup keys
sudo apt install curl # if you haven't already installed curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

# installation
sudo apt-get update
sudo apt install ros-melodic-desktop-full
# Full desktop version is recommended

#initialize rosdep
sudo rosdep init
rosdep update

# setup environment
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc

# fulfill dependencies
sudo apt install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential
```

{% endtab %}

{% tab title="zsh setup" %}

```bash
# setup sources.list
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# setup keys
sudo apt install curl # if you haven't already installed curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

# installation
sudo apt-get update
sudo apt install ros-melodic-desktop-full
# Full desktop version is recommended

#initialize rosdep
sudo rosdep init
rosdep update

# setup environment
echo "source /opt/ros/melodic/setup.zsh" >> ~/.zshrc
source ~/.zshrc

# fulfill dependencies
sudo apt install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential
```

{% endtab %}
{% endtabs %}

{% hint style="warning" %}
If the above install fails, follow the instructions given here:
{% endhint %}

{% embed url="<http://wiki.ros.org/kinetic/Installation/Ubuntu>​" caption="" %}

{% hint style="info" %}
If you have to install more packages, use `sudo apt install ros-melodic-PACKAGE`  
You can check for available packages via `apt search ros-melodic`
{% endhint %}
