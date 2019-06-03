# Table of contents

* [Introduction](README.md)
* [Tutorials](tutorials-1/README.md)
  * [Workspace Setup](tutorials-1/workspace-setup/README.md)
    * [Installing Ubuntu](tutorials-1/workspace-setup/installing-ubuntu.md)
    * [Basic Linux Setup](tutorials-1/workspace-setup/untitled.md)
    * [Spruce up your space](tutorials-1/workspace-setup/spruce-up-your-space.md)
    * [ROS Setup](tutorials-1/workspace-setup/ros-setup.md)
    * [PX4 Setup](tutorials-1/workspace-setup/px4-setup/README.md)
      * [PX4 Toolchain Setup](tutorials-1/workspace-setup/px4-setup/px4-toolchain-setup.md)
  * [How to Write a ROS Package](tutorials-1/how-to-write-a-ros-package/README.md)
    * [ROS Package](tutorials-1/how-to-write-a-ros-package/ros-package.md)
    * [Node Handles, Parameters, and Topics](tutorials-1/how-to-write-a-ros-package/node-handles-parameters-and-topics.md)
    * [Coding Standards](tutorials-1/how-to-write-a-ros-package/coding-standards.md)
    * [Transformations](tutorials-1/how-to-write-a-ros-package/transformations.md)
    * [Conversions](tutorials-1/how-to-write-a-ros-package/conversions.md)
  * [Package Installation](tutorials-1/package-installation.md)
  * [Cheatsheets](tutorials-1/cheatsheets.md)
  * [Miscellaneous](tutorials-1/miscellaneous/README.md)
    * [Odroid XU4 Setup](tutorials-1/miscellaneous/odroid-xu4-setup.md)
    * [Simulation using Offboard Control](tutorials-1/miscellaneous/simulation-using-offboard-control/README.md)
      * [Enable Offboard Mode in PX4](tutorials-1/miscellaneous/simulation-using-offboard-control/enable-offboard-mode-in-px4.md)
    * [Camera Calibration](tutorials-1/miscellaneous/camera-calibration.md)
    * [Writing a UDev rule](tutorials-1/miscellaneous/writing-udev-rule.md)
    * [Sensor fusion](tutorials-1/miscellaneous/sensor-fusion.md)
    * [ArUco ROS](tutorials-1/miscellaneous/using-aruco_ros.md)
    * [TF2](tutorials-1/miscellaneous/tf2.md)
  * [Reference wiki links](tutorials-1/dump1.md)
  * [MPC setup with mavros](tutorials-1/mpc-setup-with-mavros.md)

## Concepts

* [Quaternions](concepts/quaternions/README.md)
  * [theory](concepts/quaternions/dump2.md)
* [Kalman Filters](concepts/kalman-filters.md)
* [Rotations](concepts/rotations.md)
* [Path Planning](concepts/path-planning/README.md)
  * [Grassfire Algorithm](concepts/path-planning/untitled.md)
  * [Dijkstra Algorithm](concepts/path-planning/untitled-1.md)
  * [A\* Algorithm](concepts/path-planning/a-algorithm.md)
  * [Probabilistic Roadmap](concepts/path-planning/probabilistic-roadmap.md)
  * [RRT Algorithm](concepts/path-planning/rrt-algorithm.md)
  * [Visibility Graph Analysis](concepts/path-planning/visibility-graph-analysis.md)
* [Lectures](concepts/lectures/README.md)
  * [Aerial Robotics](https://docs.google.com/presentation/d/1urhhu-BCSltQ9QCSFMuBtE4ckXMPMfLpFOiIZY1YMOY/edit#slide=id.p)
  * [Avionics](https://docs.google.com/presentation/d/1uEwSUcQViZwr0s7IRR3UJO4M-rfXotcJnbZww4TSOJY/edit#slide=id.p)
  * [Control Systems: Introduction](http://www.dis.uniroma1.it/~lanari/ControlSystems/CS%20-%20Lectures%202016/2016_Lec01_Introduction.pdf)
  * [Control Systems: Models](http://www.dis.uniroma1.it/~lanari/ControlSystems/CS%20-%20Lectures%202016/2016_Lec02_Models.pdf)
  * [Inter IIT Tech Meet 2018](https://docs.google.com/presentation/d/15JQCeglxh4gMW0vWIgDPPF8rYcScEiSRiINqZVHpNE0/edit#slide=id.p3)
  * [Kalman Filters](https://www.youtube.com/watch?v=mwn8xhgNpFY&list=PLn8PRpmsu08pzi6EMiYnR-076Mh-q3tWr)
  * [Linux and Git](https://docs.google.com/presentation/d/1KPGa-49XFCrWlBRLKL04LhY0gw5xKA6Eexpzu1QkOHY/edit#slide=id.g1e14af4804_1_81)
  * [Git Tutorial](https://www.atlassian.com/git/tutorials/learn-git-with-bitbucket-cloud)
  * [ROS](https://docs.google.com/presentation/d/1lUvV41uaQqdtztrlgkrif68w_EaiigFQHx-20KBLS0M/edit#slide=id.g1e277ae309_0_20)
  * [Rotorcraft](https://docs.google.com/presentation/d/1TMbI3keAjQU01uiV6TkL2K_ZnNua6E8ecNHpH-NTFwI/edit#slide=id.p)
  * [Software Training](https://github.com/RoboJackets/software-training)

## Control System

* [Introduction](control-system/introduction.md)
* [Model Predictive Control](control-system/model-predictive-control/README.md)
  * [System Identification](control-system/model-predictive-control/system-identification.md)
  * [Sample SysId Launch Files](control-system/model-predictive-control/example-launch-files-for-system-identification.md)
  * [Running MPC](control-system/model-predictive-control/running-mpc/README.md)
    * [MPC with Rotors](control-system/model-predictive-control/running-mpc/mpc-with-rotors.md)
    * [MPC with PX4 Sim](control-system/model-predictive-control/running-mpc/mpc-with-px4-sim.md)
    * [MPC with ROS](control-system/model-predictive-control/running-mpc/model-predictive-controls-with-ros.md)
  * [Setup with VICON](control-system/model-predictive-control/setup-with-vicon.md)
  * [Odometry from pose data](control-system/model-predictive-control/odometry-from-pose-data.md)
  * [References](control-system/model-predictive-control/mpc.md)
* [PID Controller](control-system/pid-controller/README.md)
  * [Introduction](https://www.youtube.com/watch?v=4Y7zG48uHRo)
  * [Basic Theory](https://www.youtube.com/watch?v=UR0hOmjaHp0&feature=youtu.be&t=215)
* [Offboard mode](control-system/offboard-mode.md)

## Estimation

* [Visual-Inertial Odometry](estimation/untitled/README.md)
  * [Hardware Requirements](estimation/untitled/hardware.md)
  * [Visual-Inertial Sensing](estimation/untitled/visual-inertial-sensing.md)
  * [DIYing a VI-Sensor](estimation/untitled/diying-a-vi-sensor.md)

## Computer Vision

* [Untitled](computer-vision/untitled.md)

## Machine Learning

* [Untitled](machine-learning/untitled.md)
* [Datasets](machine-learning/datasets.md)

## Hardware Integration

* [Untitled](hardware-integration/untitled.md)

## Resources

* [Courses](resources/courses/README.md)
  * [Comparison of RRT, RRT\* and RRT\*-Smart](http://paper.ijcsns.org/07_book/201610/20161004.pdf)
  * [State Space Modelling of a Multirotor](http://www.indjst.org/index.php/indjst/article/viewFile/96613/71697)
  * [Path Planning Lecture](https://courses.edx.org/asset-v1:PennX+ROBO1x+1T2017+type@asset+block@Week_9_Graph_Based_Planning_Method.pdf)
  * [Introduction to AI in Robotics](https://classroom.udacity.com/courses/cs373)
* [Useful Reading Links](resources/useful-reading-links/README.md)
  * [Aerial Robotics](resources/useful-reading-links/aerial-robotics.md)
  * [Books](resources/useful-reading-links/books.md)
  * [Computer Vision and Image Processing](resources/useful-reading-links/computer-vision-and-image-processing.md)
  * [Courses on AI and Robotics](resources/useful-reading-links/courses-on-ai-and-robotics.md)
  * [Deep Neural Network](resources/useful-reading-links/deep-neural-network.md)
  * [Dynamics and Controls system](resources/useful-reading-links/dynamics-and-controls-system.md)
  * [Motion Planning](resources/useful-reading-links/motion-planning.md)
  * [Probabilistic Robotics](resources/useful-reading-links/probabilistic-robotics.md)
  * [Programming](resources/useful-reading-links/programming.md)
  * [Robotics Hardware](resources/useful-reading-links/robotics-hardware.md)
  * [Miscellaneous and Awesome](resources/useful-reading-links/miscellaneous-and-awesome.md)

