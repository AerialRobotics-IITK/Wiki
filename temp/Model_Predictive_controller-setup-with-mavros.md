## Basic Installation
### MPC Package
Clone and install required dependencies : [ethz-asl/mav_control_rw](https://github.com/ethz-asl/mav_control_rw)
### Mavros
Clone [ethz-asl/mavros](https://github.com/ethz-asl/mavros)
### Firmware
Clone [ethz-asl/ethzasl_mav_px4](https://github.com/ethz-asl/ethzasl_mav_px4)
### RotorS
Clone [ethz-asl/rotors_simulator](https://github.com/ethz-asl/rotors_simulator)
### System Identification
Clone [ethz-asl/mav_system_identification](https://github.com/ethz-asl/mav_system_identification) and install `matlab_rosbag` 

## Write a Launch file
Create a launch file for launching the model predictive controller along with mavros. 
Say example.launch
```xml
<?xml version="1.0" encoding="UTF-8"?>
<launch>
  <arg name="mav_name" default="firefly"/>
  <arg name="namespace" default="$(arg mav_name)" />

  <!-- It is good practice to use a system namespace so that multiple MAVs can be flown on the same network -->
  <!-- <group ns="$(arg namespace)" > -->

  <!-- Autopilot interface -->
  <node pkg="mavros" type="mavros_node" name="mavros" output="screen">
   <rosparam command="load" file="$(find mavros)/launch/px4_config.yaml" />
  </node>

 

  <!-- MPC converting trajectories into attitude and thrust commands -->
  <!-- <group ns="iris" > -->
  <node name="mav_linear_mpc" pkg="mav_linear_mpc" type="mav_linear_mpc_node" respawn="false" clear_params="true" output="screen">
    <rosparam file="$(find mav_linear_mpc)/resources/linear_mpc_iris.yaml"/>
    <rosparam file="$(find mav_disturbance_observer)/resources/disturbance_observer_iris.yaml"/>
    <param name="reference_frame" value="map" />
    <!-- <param name="simulation" value="false"/> -->
    <param name="use_rc_teleop" value="false" />
    <remap from="odometry" to="/mavros/local_position/odom" />
    <remap from="command/roll_pitch_yawrate_thrust" to="mavros/setpoint_raw/roll_pitch_yawrate_thrust"/>
    <param name="autopilot_interface" value="mavros"/>
  </node>
  
  <!-- </group> -->
</launch>
```
Where `px4_config.yaml` is the file with modified URL as below

```yaml
# Configuration for PX4 autopilot

# Change to correct USB port (this is the one for the TX2 uart)
fcu_url: "udp://:14540@192.168.1.36:14557"

# setpoint_raw
setpoint_raw:
  thrust_scaling_factor: 0.0093
  system_mass_kg: 3.2
  yaw_rate_scaling_factor: 2.0

# sys_status & sys_time connection options
conn:
  heartbeat_rate: 1.0    # send hertbeat rate in Hertz
  timeout: 10.0          # hertbeat timeout in seconds
  timesync_rate: 10.0    # TIMESYNC rate in Hertz (feature disabled if 0.0)
  system_time_rate: 1.0  # send system time to FCU rate in Hertz (disabled if 0.0)

time:
  time_ref_source: "fcu"  # time_reference source
  timesync_avg_alpha: 0.6 # timesync averaging factor
``` 

## System Identification with RotorS Simulator
* Connect a joystick and use [Joy](http://wiki.ros.org/joy) package.
* Run the following command in terminal for launching joy node and remapping it to the `iris/rc` topic
  ```shell
     rosrun joy joy_node /joy:=/iris/rc
  ```
* Start the gazebo simulator with iris
  ```shell
     roslaunch rotors_gazebo mav.launch mav_name:=iris       
  ```
* Start the MPC Controller 
  ```shell
     roslaunch mav_linear_mpc mav_linear_mpc_sim.launch mav_name:=iris   
  ```
* Control iris with the help of joystick.
  **Note:** If idoesn't work check the following parameter is set to true in `mav_linear_mpc_sim.launch` file
  ```xml
   <param name="use_rc_teleop" value="true" />
  ``` 
* Record the `/iris/command/roll_pitch_yawrate_thrust` & `/iris/imu` topics using rosbag.
* Refer [ethz-asl/mav_system_identification](https://github.com/ethz-asl/mav_system_identification) & [mav_dji_ros_interface wiki](https://github.com/ethz-asl/mav_dji_ros_interface/wiki/Dynamic-System-Identification-%28via-VirtualRC%29) for using the recorded data in matlab and running the matlab plots for system model parameters.

## Update the new parameters
* MPC yaml file for iris (example `mav_linear_mpc/resources/linear_mpc_iris.yaml)
```yaml
     #==================================================================================================================
#
# Project:	MPC for multirotor systems.
#
# function:	MPC Position controller parameters
#
# Author:	Mina Kamel	mina.kamel@ethz.ch
#
# Ge:nerated:	03-Apr-2015 13:11:59
#
#==================================================================================================================

## Controller Parameters:
mass: 1.52
roll_time_constant: 0.1847
pitch_time_constant: 0.175
roll_gain: 1.017
pitch_gain: 0.789
drag_coefficients: [ 0.010000 , 0.010000, 0.0000]

q_x: 40
q_y: 40
q_z: 60

q_vx: 20
q_vy: 20
q_vz: 25

q_roll: 20
q_pitch: 20

r_roll: 35
r_pitch: 35
r_thrust: 2

r_droll: 0.3
r_dpitch: 0.3
r_dthrust: 0.0025

roll_max: deg(25.0)
pitch_max: deg(25.0)
yaw_rate_max: deg(90)
thrust_min: 5
thrust_max: 20

K_yaw: 1.8

Ki_xy: 0.2
Ki_z: 0.3
position_error_integration_limit: 2
antiwindup_ball: 0.4

enable_offset_free : true
enable_integrator : true

sampling_time: 0.01    #IMPORTANT: set this equal to the rate of odometry msg
prediction_sampling_time: 0.1
```
* Disturbance Observer file (example `mav_disturbance_observer/resources/disturbance_observer_iris.yaml`)
```yaml
## Kalman Filter Parameters:
KF_observer:
  calibration_duration: 5 #sec
  
  #covariance of initial state
  P0_position: 0.1
  P0_velocity: 0.1
  P0_attitude: 0.1
  P0_angular_velocity: 0.1
  P0_force: 0.1
  P0_torque: 0.1
  
  #process noise
  q_position: 0.01
  q_velocity: 0.025
  q_attitude: 0.015
  q_angular_velocity: 0.02
  q_force: 0.1
  q_torque: 0.1
  
  #measurement noise
  r_position: 0.001
  r_velocity: 0.0012
  r_attitude: 0.01
  
  #limits
  omega_limit :  [ 3.000000 ,3.000000 ,2.000000]
  external_forces_limit :  [ 5.000000 ,5.000000 ,3.0000000]      #m/s^2
  external_moments_limit :  [ 20.000000 ,20.000000 ,20.000000]  #rad/s^2

  #model from system identification (2nd order attitude model)
  drag_coefficients : [ 0.010000 , 0.010000 , 0]
  roll_omega : 11.05
  roll_damping : 0.91
  roll_gain : 0.99
  pitch_omega : 6.64
  pitch_damping : 0.309
  pitch_gain : 0.758
  yaw_omega : 5.000000
  yaw_damping : 0.950000
  yaw_gain : 1.000000
```

## Show Time!!
* Run the following commands on terminal
```shell
cd ethzasl_mav_px4
make posix_sitl_default gazebo
```
* Launch the new launch file
```shell
roslaunch mavros example.launch
```
* Start `Q ground control` and put the quad in offboard mode
* Increase the odometry topic rates in `mavlink_main.cpp` if data lags.
  