---
description: >-
  This page contains codes and resources for the event DRDO DGRE's Vision Based
  Obstacle Avoidance Drone in the Inter IIT Tech Meet 9.0
---

# Inter-IIT TechMeet 9.0

## Inter-IIT TechMeet 9.0

#### Problem Statement

{% file src="../.gitbook/assets/DRDO_VOAD_ps.pdf" %}
VOAD Problem Statement
{% endfile %}

#### Technical Report & Slides

This file contains our architecture and approach to the problem statement:

{% file src="../.gitbook/assets/9_Documentation.pdf" %}
Technical Report
{% endfile %}

This file contains the slides presented after the competition:

{% file src="../.gitbook/assets/9_Presentation.pdf" %}
Slides
{% endfile %}

#### Software Stack

The complete software stack is available on Github. It contains all the modules we have used:

* [https://github.com/AerialRobotics-IITK/inter\_iit\_dgre\_voad](https://github.com/AerialRobotics-IITK/inter\_iit\_dgre\_voad)

**General Overview of the modules used:**

* **Explorer**: This Module Integrates the Takeoff, Landing, Detection and planning modules. Publishes final setpoints for landing of the quadrotor
* **Box\_Detector**: Uses the downward facing camera to detect the ArUco marker and calculate its position provided it has the id 0 using OpenCV.
* **Active\_Planner**: This Module is responsible for finding and evaluating frontiers in a 3D environment based on a TSDF (Truncated Signed Distance Function) map. It Then checks if there is a waypoint in the queue and if not, selects and adds the best frontier. If there is a waypoint, it generates a trajectory using a graph based search algorithm, tracks it, and if aborted, selects a new frontier for the process to repeat.
* **Broadcaster**: This module listens to the pose topic and broadcasts a transform from the "map" frame to the "base\_link" frame using TF2.





####
