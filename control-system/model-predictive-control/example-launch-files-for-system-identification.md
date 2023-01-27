---
description: Sample launch files that can be used to do system identification.
---

# Sample SysId Launch Files

## Using GPS and PX4

```markup
<?xml version="1.0" encoding="UTF-8"?>
<launch>
  <arg name="mav_name" default="example"/>
  <arg name="namespace" default="$(arg mav_name)" />

  <!-- It is good practice to use a system namespace so that multiple MAVs can be flown on the same network -->
  <group ns="$(arg namespace)" >

  <!-- Autopilot interface -->
  <node pkg="mavros" type="mavros_node" name="mavros" output="screen">
    <rosparam command="load" file="$(find mav_startup)/parameters/mavs/$(arg mav_name)/px4_config.yaml" />
  </node>

  <!-- MPC converting trajectories into attitude and thrust commands -->
  <node name="mav_nonlinear_mpc" pkg="mav_nonlinear_mpc" type="nonlinear_mpc_node" respawn="false" clear_params="true" output="screen">
    <remap from="odometry" to="mavros/local_position/odom" />
    <remap from="rc" to="mavros/rc/in" />
    <rosparam file="$(find mav_startup)/parameters/mavs/$(arg mav_name)/nonlinear_mpc.yaml"/>
    <rosparam file="$(find mav_startup)/parameters/mavs/$(arg mav_name)/disturbance_observer.yaml"/>
    <param name="simulation" value="false"/>
    <param name="autopilot_interface" value="mavros"/>
    
    <remap from="command/roll_pitch_yawrate_thrust" to="mavros/setpoint_raw/roll_pitch_yawrate_thrust"/>
  </node>
  
  </group>
</launch>
```

## Using VI Sensor and PX4

```markup
<?xml version="1.0" encoding="UTF-8"?>
<launch>
  <arg name="mav_name" default="example"/>
  <arg name="namespace" default="$(arg mav_name)" />

  <!-- It is good practice to use a system namespace so that multiple MAVs can be flown on the same network -->
  <group ns="$(arg namespace)" >

  <!-- Autopilot interface -->
  <node pkg="mavros" type="mavros_node" name="mavros" output="screen">
    <rosparam command="load" file="$(find mav_startup)/parameters/mavs/$(arg mav_name)/px4_config.yaml" />
  </node>

  <!-- Provides VI Odometry to the system -->
  <node name="rovio" pkg="rovio" type="rovio_node" output="screen">
    <param name="filter_config" value="$(find mav_startup)/parameters/mavs/$(arg mav_name)/rovio_filter.info" />
    <param name="camera0_config" value="$(find mav_startup)/parameters/mavs/$(arg mav_name)/rovio_cam0.yaml" />
    <remap from="cam0/image_raw" to="image_raw"/>
    <remap from="imu0" to="mavros/imu/data_raw"/>
  </node>
  
  <!-- Compensates for the lag rovio induces by integrating IMU data -->
  <node pkg="odom_predictor" type="odom_predictor_node" name="odom_predictor" output="screen">
    <remap from="odometry" to="rovio/odometry"/>
    <remap from="imu_bias" to="rovio/imu_biases"/>
    <remap from="imu" to="mavros/imu/data_raw"/>
  </node>
  
  <!-- MPC converting trajectories into attitude and thrust commands -->
  <node name="mav_nonlinear_mpc" pkg="mav_nonlinear_mpc" type="nonlinear_mpc_node" respawn="false" clear_params="true" output="screen">
    <remap from="odometry" to="odom_predictor/predicted_odometry" />
    <remap from="rc" to="mavros/rc/in" />
    <rosparam file="$(find mav_startup)/parameters/mavs/$(arg mav_name)/nonlinear_mpc.yaml"/>
    <rosparam file="$(find mav_startup)/parameters/mavs/$(arg mav_name)/disturbance_observer.yaml"/>
    <param name="simulation" value="false"/>
    <param name="autopilot_interface" value="mavros"/>
    
    <remap from="command/roll_pitch_yawrate_thrust" to="mavros/setpoint_raw/roll_pitch_yawrate_thrust"/>
  </node>
  
  </group>
</launch>
```

## Using VICON and PX4&#x20;

```markup
<?xml version="1.0" encoding="UTF-8"?>
<launch>
  <arg name="mav_name" default="example"/>
  <arg name="namespace" default="$(arg mav_name)" />

  <!-- It is good practice to use a system namespace so that multiple MAVs can be flown on the same network -->
  <group ns="$(arg namespace)" >

  <!-- Autopilot interface -->
  <node pkg="mavros" type="mavros_node" name="mavros" output="screen">
    <rosparam command="load" file="$(find mav_startup)/parameters/mavs/$(arg mav_name)/px4_config.yaml" />
  </node>

  <!-- Provides pose of robot to the system -->
  <!-- use your Vicon machine ip accordingly -->
  <include file="$(find vrpn_client_ros)/launch/sample.launch"/>  
  <!-- Compensates for the lag rovio induces by integrating IMU data -->
  
  <!-- use Odometry from pose for odometry messages-->  
  
  <!-- MPC converting trajectories into attitude and thrust commands -->
  <node name="mav_nonlinear_mpc" pkg="mav_nonlinear_mpc" type="nonlinear_mpc_node" respawn="false" clear_params="true" output="screen">
    <remap from="odometry" to="odom_predictor/predicted_odometry" />
    <remap from="rc" to="mavros/rc/in" />
    <rosparam file="$(find mav_startup)/parameters/mavs/$(arg mav_name)/nonlinear_mpc.yaml"/>
    <rosparam file="$(find mav_startup)/parameters/mavs/$(arg mav_name)/disturbance_observer.yaml"/>
    <param name="simulation" value="false"/>
    <param name="autopilot_interface" value="mavros"/>
    
    <remap from="command/roll_pitch_yawrate_thrust" to="mavros/setpoint_raw/roll_pitch_yawrate_thrust"/>
  </node>
  
  </group>
</launch>
```

## Example Param files

* `px4_config.yaml`

```yaml
# Configuration for PX4 autopilot

# Change to correct USB port (this is the one for the TX2 uart)
fcu_url: "/dev/ttyTHS2:921600"

# setpoint_raw
setpoint_raw:
  thrust_scaling_factor: 0.0093
  system_mass_kg: 2.5
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

* `disturbance_observer.yaml`

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
  q_force: 0.05
  q_torque: 0.01
  
  #measurement noise
  r_position: 0.2
  r_velocity: 0.2
  r_attitude: 0.2
  
  #limits
  omega_limit :  [ 3.000000 ,3.000000 ,2.000000]
  external_forces_limit :  [ 5.000000 ,5.000000 ,3.0000000]      #m/s^2
  external_moments_limit :  [ 20.000000 ,20.000000 ,20.000000]  #rad/s^2

  #model from system identification (2nd order attitude model)
  drag_coefficients: [0.020000, 0.020000, 0.000000]
  roll_gain: 0.964957
  roll_damping: 0.672272
  roll_omega: 10.540684
  pitch_gain: 0.970397
  pitch_damping: 0.648367
  pitch_omega: 10.177723
  yaw_gain: 1.000000
  yaw_damping: 0.950000
yaw_omega: 5.000000
```

* `disturbance_observer.yaml`

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
  q_force: 0.05
  q_torque: 0.01
  
  #measurement noise
  r_position: 0.2
  r_velocity: 0.2
  r_attitude: 0.2
  
  #limits
  omega_limit :  [ 3.000000 ,3.000000 ,2.000000]
  external_forces_limit :  [ 5.000000 ,5.000000 ,3.0000000]      #m/s^2
  external_moments_limit :  [ 20.000000 ,20.000000 ,20.000000]  #rad/s^2

  #model from system identification (2nd order attitude model)
  drag_coefficients: [0.020000, 0.020000, 0.000000]
  roll_gain: 0.964957
  roll_damping: 0.672272
  roll_omega: 10.540684
  pitch_gain: 0.970397
  pitch_damping: 0.648367
  pitch_omega: 10.177723
  yaw_gain: 1.000000
  yaw_damping: 0.950000
yaw_omega: 5.000000
```
