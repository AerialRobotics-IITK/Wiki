# Table of contents

* [Introduction](README.md)

## Tutorials

* [TF2](tutorials/tf2.md)
* [Workspace Setup](tutorials/workspace-setup/README.md)
  * [Installing Ubuntu](tutorials/workspace-setup/installing-ubuntu.md)
  * [Basic Linux Setup](tutorials/workspace-setup/untitled.md)
  * [Spruce up your space](tutorials/workspace-setup/spruce-up-your-space.md)
  * [ROS Setup](tutorials/workspace-setup/ros-setup.md)
  * [PX4 Setup](tutorials/workspace-setup/px4-setup/README.md)
    * [PX4 Toolchain Setup](tutorials/workspace-setup/px4-setup/px4-toolchain-setup.md)
* [How to Write a ROS Package](tutorials/how-to-write-a-ros-package/README.md)
  * [ROS Package](tutorials/how-to-write-a-ros-package/ros-package.md)
  * [Node Handles, Parameters, and Topics](tutorials/how-to-write-a-ros-package/node-handles-parameters-and-topics.md)
  * [Coding Standards](tutorials/how-to-write-a-ros-package/coding-standards.md)
  * [Transformations](tutorials/how-to-write-a-ros-package/transformations.md)
  * [Conversions](tutorials/how-to-write-a-ros-package/conversions.md)
* [Odroid XU4 Setup](tutorials/odroid-xu4-setup.md)
* [Simulation using Offboard Control](tutorials/simulation-using-offboard-control/README.md)
  * [Enable Offboard Mode in PX4](tutorials/simulation-using-offboard-control/enable-offboard-mode-in-px4.md)
* [ARUCO\_ROS](tutorials/using-aruco_ros.md)
* [Package Installation](tutorials/package-installation.md)
* [Sensor fusion](tutorials/sensor-fusion/README.md)
  * [DCM Tutorial](http://www.starlino.com/wp-content/uploads/data/dcm_tutorial/Starlino_DCM_Tutorial_01.pdf)
* [Reference wiki links](tutorials/dump1.md)
* [CMake](tutorials/cmake.md)
* [MPC setup with mavros](tutorials/mpc-setup-with-mavros.md)
* [Camera Calibration](tutorials/camera-calibration.md)
* [Writing udev rule](tutorials/writing-udev-rule.md)

## Concepts

* [PID](concepts/pid/README.md)
  * [Introduction](https://www.youtube.com/watch?v=4Y7zG48uHRo)
  * [Basic Theory](https://www.youtube.com/watch?v=UR0hOmjaHp0&feature=youtu.be&t=215)
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
  * [Git Tutorial](https://www.atlassian.com/git/tutorials)
  * [ROS](https://docs.google.com/presentation/d/1lUvV41uaQqdtztrlgkrif68w_EaiigFQHx-20KBLS0M/edit#slide=id.g1e277ae309_0_20)
  * [Rotorcraft](https://docs.google.com/presentation/d/1TMbI3keAjQU01uiV6TkL2K_ZnNua6E8ecNHpH-NTFwI/edit#slide=id.p)
  * [Software Training](https://github.com/RoboJackets/software-training)

## Control System

* [Introduction](control-system/introduction.md)
* [Model Predictive Control](control-system/model-predictive-control/README.md)
  * [System Identification](control-system/model-predictive-control/system-identification.md)
  * [Sample SysId Launch Files](control-system/model-predictive-control/example-launch-files-for-system-identification.md)
  * [MPC with ROS](control-system/model-predictive-control/model-predictive-controls-with-ros.md)
  * [Running MPC](control-system/model-predictive-control/running-mpc/README.md)
    * [MPC with Rotors](control-system/model-predictive-control/running-mpc/mpc-with-rotors.md)
    * [MPC with PX4 Sim](control-system/model-predictive-control/running-mpc/mpc-with-px4-sim.md)
  * [Setup with Vicon](control-system/model-predictive-control/setup-with-vicon.md)
  * [Odometry from pose data](control-system/model-predictive-control/odometry-from-pose-data.md)
  * [References](control-system/model-predictive-control/mpc.md)
* [PID Controller](control-system/pid-controller.md)

## Resources

* [Useful Repositories](resources/useful-repositories.md)
* [References](resources/references/README.md)
  * [Websites](resources/references/websites.md)
  * [PDFs](resources/references/pdfs/README.md)
    * [Path Planning Lecture](https://courses.edx.org/asset-v1:PennX+ROBO1x+1T2017+type@asset+block@Week_9_Graph_Based_Planning_Method.pdf)
    * [Comparison of RRT, RRT\* and RRT\*-Smart](http://paper.ijcsns.org/07_book/201610/20161004.pdf)
  * [Papers](resources/references/papers/README.md)
    * [State Space Modelling of a Multirotor](http://www.indjst.org/index.php/indjst/article/viewFile/96613/71697)
  * [Courses](resources/references/courses/README.md)
    * [Introduction to AI in Robotics](https://classroom.udacity.com/courses/cs373)
  * [Datasets](resources/references/datasets.md)
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

## Offboard control from PX4

* [Offboard mode](offboard-control-from-px4/offboard-mode.md)

## Estimation

* [Visual-Inertial Odometry](estimation/untitled/README.md)
  * [Hardware Requirements](estimation/untitled/hardware.md)
  * [Visual-Inertial Sensing](estimation/untitled/visual-inertial-sensing.md)
  * [DIYing a VI-Sensor](estimation/untitled/diying-a-vi-sensor.md)

## Computer Vision

* [Untitled](computer-vision/untitled.md)

## Machine Learning

* [Untitled](machine-learning/untitled.md)

## Hardware Integration

* [Untitled](hardware-integration/untitled.md)

