---
description: All about VI sensors.
---

# Visual-Inertial Sensing

Visual-inertial sensors are a popular sensor choice for SLAM due to a large number of advantages over other sensor setups

* Unlike monocular SLAM, the maps have an absolute scale.
* State estimation and feature tracking is more robust to motion blur and fast rotations than visual only systems.
* IMU predictions can be used to give near instant state-estimates at over 100 Hz.
* The setup is cheaper, smaller, lighter and lower power then lidar or stereo setups.

However, there are two large downsides

* Small errors in the relative timestamps of the IMU and camera can cause large errors or divergence in the state estimation
* The system must continually estimate and compensate for biases in the IMU readings.

Some odometry systems \(e.g. VINS mono\) will attempt to compensate for timing errors, while others \(e.g. ROVIO\) require that all timestamps are accurate.

## Timestamp accuracy

The timing accuracy needed will depend on the application and the state-estimator, however from handheld experiments with ROVIO we have found that generally:

*  **Within 2ms:** improving timing accuracy beyond this has minimal to no effect.
*  **Within 5ms:** general movements can be tracked, but fast changes can cause loss of tracking / divergence.
*  **Within 20ms:** slow careful movements can result in usable state estimates.
*  **Over 20ms:** unusable, instant divergence.

## The heart of the problem

Many sensors \(including almost all cameras\) simply timestamp their data on arrival at the computer. However there are a large number of delays that prevent this stamp from being accurate. These include:

* Camera exposure time
* Internal data processing
* Internal filtering \(for IMUs\)
* Data transfer
* The OS scheduler pausing the driver process

For most of the cameras we have tested these delays are usually in the range of 5 to 30ms. While some components of this delay are fairly constant and may be accounted for by a hardcoded offset, others may vary by 5ms plus per image. These unknown delays prevents any sensor that is timestamped on the host computer from providing accurate timing information to any visual-inertial estimator.

##  IMU Bias and Scale

Every MEMS IMU has an unknown bias to its measurements. This bias is dependent on temperature, humidity and several other factors that cause it to slowly change over time. This causes issues for the state estimator as any motion the system undergoes could also be explained by the bias changing. The main difference between a $1 and $1000 IMU is not their sensitivity, but the amount of bias and its rate of change \(often the expensive IMU's are basically just a cheap IMU that is measuring temperature and performing corrections\). The slower the bias of a system changes, the more observable the motion is and the more robust the system becomes.

## Commercial solutions

Only a small number of commercial solutions exist and we are currently unaware of any sensor that does not have a fatal flaw. Sensors and their issues:

* Skybotics VI-sensor \(bundles IMU messages, never made it out of prototype and discontinued\)
* Sky-aware VI-sensor \(bundles IMU messages, never made it out of prototype and discontinued\)
* Realsense ZR300 \(gyro and accelerometer run at different rates, discontinued\)
* Realsense D435i \(gyro and accelerometer run at different rates, and run with IR frame for global frame camera and sync\)
* Optor sensor \(software timestamping\)
* ZED-mini \(still evaluating, but results so far are poor\)

