---
description: This page contains codes and resources for the IMAV 2019 Outdoor Challenge
---

# IMAV 2019, Madrid, Spain

IMAV 2019 was the 11th International Micro Air Vehicle Competition and Conference, held from 30th October to 4th November in Madrid, Spain.

### Problem Statement

{% file src="../.gitbook/assets/imav-ps.pdf" caption="IMAV 2019 Competition Rules" %}

### Proposal For IMAV2019

{% file src="../.gitbook/assets/imav\_report.pdf" caption="Team Aerial Robotics Proposal" %}

This contains the approach proposed by the Team for the Outdoor Challenge before the competition.

### Software Stack

The complete software stack is available on Github. It contains all the modules we have used:

- [https://github.com/AerialRobotics-IITK/imav2019](https://github.com/AerialRobotics-IITK/imav2019)

### General Overview of the modules used

- **Planner**: A Finite State Machine implementation using the Boost C++ libraries for decision making, state transitions and actions during the mission.
- **Detector**: A detection and pose estimation module to detect the colored mailboxes in the field.
- **Helipad Detector**: A Helipad Detection module for accurate and precise landing on a helipad.
- **Router**: A message reception, checks and feedback system for keeping track of the detected mailboxes between the UAVs. Implemented with help of the [multimaster_fkie](https://github.com/fkie/multimaster_fkie) package used to sync messages among the UAVs.
- **Collision Avoidance**: A collision avoidance module for a multi-UAV system.
- **Feature Detector**: A feature detection module for detection of a house roof and a crashed UAV.
