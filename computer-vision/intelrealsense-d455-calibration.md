---
description: Calibration of IntelRealSenseD455 using AprilGrid
---

# IntelRealSense D455 Calibration

### Installing Kalibr

#### Building Kalibr from Source

1.  Install the necessary dependencies:

    ```bash
    sudo apt-get install -y git wget autoconf automake nano libeigen3-dev libboost-all-dev libsuitesparse-dev doxygen libopencv-dev libpoco-dev libtbb-dev libblas-dev liblapack-dev libv4l-dev python3-dev python3-pip python3-scipy python3-matplotlib ipython3 python3-wxgtk4.0 python3-tk python3-igraph python3-pyx
    ```
2.  Create and configure a workspace:

    ```bash
    mkdir -p ~/kalibr_workspace/src
    cd ~/kalibr_workspace
    export ROS1_DISTRO=noetic # Replace 'noetic' with your ROS version
    source /opt/ros/$ROS1_DISTRO/setup.bash
    catkin init
    catkin config --extend /opt/ros/$ROS1_DISTRO
    catkin config --cmake-args -DCMAKE_BUILD_TYPE=Release
    ```
3.  Clone the Kalibr project and build it:

    ```bash
    cd ~/kalibr_workspace/src
    git clone https://github.com/ethz-asl/kalibr.git
    cd ~/kalibr_workspace/
    catkin build -DCMAKE_BUILD_TYPE=Release -j4
    ```

    Source the workspace setup:

    ```bash
    source ~/kalibr_workspace/devel/setup.bash
    ```

### Recording a Rosbag

To record a rosbag, follow these steps:

1.  Start ROS using the command:

    ```bash
    roscore
    ```
2.  Install the IntelRealSense ROS package for your ROS distribution:

    ```bash
    sudo apt-get install ros-$ROS_DISTRO-realsense2-camera
    source devel/setup.bash
    ```
3.  Launch the camera node using:

    ```bash
    roslaunch realsense2_camera rs_camera.launch
    ```
4.  Check that camera topics are listed with:

    ```bash
    rostopic list
    ```

    You should see topics such as `camera/color/image_raw`.
5.  Record a rosbag from all topics:

    ```bash
    rosbag record -a
    ```

    Press Ctrl+C to stop recording. The rosbag will be saved in the current directory.

    **Important points during recording:**

    * Excite all IMU axes (rotation and translation).
    * Avoid shocks, especially at the beginning and end of recording.
    * Maintain low motion blur through low shutter times and good illumination.
    * Ensure timestamps have low jitter and are synchronized.
6.  Check the rosbag info and play it using:

    ```bash
    rosbag info
    rosbag play
    ```



### Calibrating the Camera Using AprilGrid

1. Ensure the AprilGrid details are specified in a `.yaml` file.
2.  To calibrate the camera, run the following command in the directory containing the `.yaml` file and rosbag:

    ```bash
    rosrun kalibr kalibr_calibrate_cameras --target [name of .yaml file] --models [camera/distortion models to be fitted] --topics [name of topic where image from camera is being published] --bag [path to rosbag] --bag-freq 10.0 --show-extraction
    ```

    **Notes:**

    * The camera distortion model used should be `pinhole-radtan`.
    * The `--show-extraction` flag shows the calibration alongside the feed.
    * The `--bag-freq 10.0` sets the playback frequency of the rosbag to 10 Hz during calibration.

The results of the calibration process will be saved in a PDF and the matrix parameters will be stored in a `.yaml` file in the same directory.

