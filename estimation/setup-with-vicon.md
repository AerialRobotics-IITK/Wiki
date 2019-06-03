---
description: The beginning of indoor navigation.
---

# Setup with VICON

## Initial setup of VICON

* **Camera and data stream setup:**

{% embed url="https://www.vicon.com" caption="" %}

![Setup For Vicon and Robot](../.gitbook/assets/vicon_setup.png)

* Creating Object in [VICON Tracker](https://www.vicon.com/products/software/tracker)
  * First align Robot's front with global frame's x-axis then create object.

{% hint style="warning" %}
Alignment is compulsory to avoid problem with velocity and orientation of robot.
{% endhint %}

## Getting pose data on Onboard Processor

* Using [ROS](http://wiki.ros.org/kinetic/Installation/Ubuntu), get data from the VICON Machine
  * According to your processor you can use the following methodsL

{% tabs %}
{% tab title="x86 based Processors" %}
* Processors like [Intel NUC ](https://www.intel.in/content/www/in/en/products/boards-kits/nuc.html)
  * Install the `vicon_bridge` package from

{% embed url="https://github.com/ethz-asl/vicon\_bridge" %}
{% endtab %}

{% tab title="ARM Based Processors" %}
* Processors like[ Odroid XU4](https://wiki.odroid.com/odroid-xu4/odroid-xu4), [Raspberry Pi](https://www.raspberrypi.org/)

  * Install the `vrpn_client_ros` using

  ```bash
  sudo apt-get install ros-kinetic-vrpn-client-ros -y
  ```

{% embed url="http://wiki.ros.org/vrpn\_client\_ros" %}
{% endtab %}
{% endtabs %}

## Odometry from Pose data

{% page-ref page="odometry-from-pose-data.md" %}



