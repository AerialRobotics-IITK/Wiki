---
description: How to calibrate the camera.
---

# Camera Calibration

The standard camera model used in OpenCV and ROS is referred to as the Pinhole model. You can read more about it here:

{% embed url="https://docs.opencv.org/2.4/modules/calib3d/doc/camera_calibration_and_3d_reconstruction.html" %}

[ ](https://gajena.gitbook.io/aerial-robotics/camera\_calibration)The camera can be calibrated by one of the three following ways:

### 1.Kalibr

Kalibr is toolbox for multiple camera and sensor calibration.

{% embed url="https://github.com/ethz-asl/kalibr" %}

### 2. OpenCV

Use the functions mentioned in the above link after installing and importing the OpenCV package.

### 3. ROS

Use the camera\_calibration ROS package:

{% embed url="http://wiki.ros.org/camera_calibration​" %}

### 4. MATLAB

Use the MATLAB app for camera calibration:

{% embed url="https://in.mathworks.com/help/vision/ug/single-camera-calibrator-app.html" %}
