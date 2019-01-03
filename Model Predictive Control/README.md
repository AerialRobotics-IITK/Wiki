---
description: Setup of Quadrotor with Vicon tracking system.
---

# Setup with Vicon

* For initial setup of vicon : like camera and data stream setup </br>
  visit:
  {% embed url="https://www.vicon.com/" %}


![Alt text](./vicon_setup.png?raw=true "Optional Title")

* Getting pose data on Onboard Processor using [ROS](http://wiki.ros.org/kinetic/Installation/Ubuntu)  from Vicon PC
    
    * Install vicon_bridge Package from  
    {% embed url="https://github.com/ethz-asl/vicon_bridge" %} </br>
    
    Or

    * Install `vrpn_client_ros` package using:
    ```shell
    sudo apt-get install ros-kinetic-vrpn-client-ros -y
    ```
    {% embed url="http://wiki.ros.org/vrpn_client_ros" %}

