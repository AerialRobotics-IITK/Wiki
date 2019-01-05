---
description: >-
  A brief guide to running a simulation with the drone in off board control
  mode.
---

# Simulation using Offboard Control

Firstly, follow this page to put the drone in offboard control mode through PX4:

{% page-ref page="enable-offboard-mode-in-px4.md" %}

The following page shows how to run the drone in offboard control using ROS:

{% embed url="https://dev.px4.io/v1.8.2/en/ros/mavros\_offboard.html" %}

To run a simulation using Gazebo, enter the following commands in your terminal:

```bash
cd <path_to_Firmware>/Firmware
make posix_sitl_default gazebo    
```

![](../../.gitbook/assets/gazebo.png)

This will bring up the PX4 shell:

```text
[init] shell id: 140735313310464
[init] task name: px4

______  __   __    ___
| ___ \ \ \ / /   /   |
| |_/ /  \ V /   / /| |
|  __/   /   \  / /_| |
| |     / /^\ \ \___  |
\_|     \/   \/     |_/

px4 starting.


pxh> 
```

{% hint style="info" %}
Type **help** for more information on the PX4 shell and its commands.
{% endhint %}

For further instructions follow this page:

{% embed url="https://dev.px4.io/v1.8.2/en/simulation/ros\_interface.html" %}

