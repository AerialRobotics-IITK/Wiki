---
description: >-
  This page contains codes and resources for the event DRDO's UAV Guided UGV
  Navigation Challenge in the Inter IIT Tech Meet 10.0
---

# Inter-IIT TechMeet 10.0

## Inter-IIT TechMeet 10.0

#### Problem Statement

{% file src="../.gitbook/assets/DRDO_UAV_ps.pdf" %}
UGV navigation challenge problem Statement
{% endfile %}

#### Technical Report & Slides

This file contains our architecture and approach to the problem statement:

{% file src="../.gitbook/assets/10_Documentation.pdf" %}
Technical Report
{% endfile %}

This file contains the slides presented after the competition:

{% file src="../.gitbook/assets/10_presentation.pdf" %}
Slides
{% endfile %}



#### Software Stack

The complete software stack is available on Github. It contains all the modules we have used:

* [https://github.com/AerialRobotics-IITK/inter\_iit\_uav\_guided\_ugv](https://github.com/AerialRobotics-IITK/inter\_iit\_uav\_guided\_ugv)

**General Overview of the modules used:**

* **Offboard**: This Module initializes an offboard flight node in ROS, waits for the MAVROS connection, and performs a takeoff procedure to guide the vehicle to a specified altitude.
* **Prius\_Controller**: It is responsible for waypoint publishing, steering and throttle/brake control of the UGV based on different controllers.
* **Prius Detector**: This Module performs localization calculations to estimate UGV's position and velocity.
* **Segmentation**: This Module segments the road from the pointcloud using RANSAC along with some heuristics and algorithms for eliminating rogue data.
* **Visualization**: This code initializes a ROS node for visualizing trajectories using markers, subscribing to odometry data and reading a CSV file to extract points for the mean path. shorten

####
