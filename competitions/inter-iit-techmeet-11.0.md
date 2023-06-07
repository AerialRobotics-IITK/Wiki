---
description: >-
  This page contains codes and resources for the event Drona Aviation Pluto
  Drone swarm challenge in the Inter-IIT TechMeet 11.0
---

# Inter-IIT TechMeet 11.0

## Inter-IIT TechMeet 11.0

#### Problem Statement

{% file src="../.gitbook/assets/Drona_ps.pdf" %}

#### Technical Report & Slides

This file contains our architecture and approach to the problem statement:

{% file src="../.gitbook/assets/11_Documentation.pdf" %}

This file contains the slides presented after the competition:

{% file src="../.gitbook/assets/11_Presentation.pptx" %}

#### Software Stack

The complete software stack is available on Github. It contains all the modules we have used:

* [https://github.com/AerialRobotics-IITK/interiit\_11.0](https://github.com/AerialRobotics-IITK/interiit\_11.0)

**General Overview of the modules used:**

* **Pose\_ocam**: A detection and pose estimation module to detect the aruco marker and calculate the corresponding pose of the marker.
* **Pluto\_control**: A module which acts as a server for the socket communication. It receives the raw position from the pose\_ocam module, applies kalman filter to it for smoothening, uses the MPC control theory to calculate the desired Roll, Pitch, Yaw and Thrust and sends it to the drone using the MSP protocol.
* **Visualizer**: A module for accurate and precise visualization of the P,I,D values along with variable thrust, roll, pitch, and yaw plotted over time
