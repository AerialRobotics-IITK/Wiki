---
description: This page contains codes and resources for the Inter IIT Tech Meet'21
---

# Inter IIT Tech Meet 9.0

DRDO DGRE's Vision Based Obstacle Avoidance Drone

{% hint style="info" %}
Check out the presentation [here](https://www.youtube.com/watch?v=PdL64qHd97I?t=191m11s)
{% endhint %}

### Presentation

{% file src="https://raw.githubusercontent.com/AerialRobotics-IITK/inter_iit_dgre_voad/main/Inter%20IIT%209%20Presentation.pdf" caption="Inter IIT Tech Meet'21 Competition Rules" %}

### Proposal For IMAV2019

{% file src="https://raw.githubusercontent.com/AerialRobotics-IITK/inter_iit_dgre_voad/main/DRDO_Report_IITK.pdf" caption="Team Aerial Robotics Proposal" %}

### Software Stack

The complete software stack is available on Github. It contains all the modules we have used:

- [https://github.com/AerialRobotics-IITK/inter_iit_dgre_voad](https://github.com/AerialRobotics-IITK/inter_iit_dgre_voad/)

### General Overview of the modules used

- **Active_Planner**: Main package for frontier based exploration and path-planning
- **Box_Detector**: Detect the ARUCO Markers and global pose
- **Broadcaster**: for Debugging
- **Detector_Msgs**: Custom messages
- **Explorer**: Handle states of the UAV
- **Interiit21**: Starter Package with Launch files
