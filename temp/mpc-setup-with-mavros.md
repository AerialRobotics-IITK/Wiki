# MPC setup with mavros

### Basic Installation <a id="basic-installation"></a>

#### MPC Package <a id="mpc-package"></a>

Clone and install required dependencies : [ethz-asl/mav\_control\_rw](https://github.com/ethz-asl/mav_control_rw)​

#### Mavros <a id="mavros"></a>

Clone [ethz-asl/mavros](https://github.com/ethz-asl/mavros)​

#### Firmware <a id="firmware"></a>

Clone [ethz-asl/ethzasl\_mav\_px4](https://github.com/ethz-asl/ethzasl_mav_px4)​

#### RotorS <a id="rotors"></a>

Clone [ethz-asl/rotors\_simulator](https://github.com/ethz-asl/rotors_simulator)​

#### System Identification <a id="system-identification"></a>

Clone [ethz-asl/mav\_system\_identification](https://github.com/ethz-asl/mav_system_identification) and install `matlab_rosbag`

### Write a Launch file <a id="write-a-launch-file"></a>

Create a launch file for launching the model predictive controller along with mavros. Say example.launch

```text

```

Where `px4_config.yaml` is the file with modified URL as below

```text

```

### System Identification with RotorS Simulator <a id="system-identification-with-rotors-simulator"></a>

* Connect a joystick and use [Joy](http://wiki.ros.org/joy) package.
* Run the following command in terminal for launching joy node and remapping it to the `iris/rc` topic

  ```text

  ```

* Start the gazebo simulator with iris

  ```text

  ```

* Start the MPC Controller

  ```text

  ```

* Control iris with the help of joystick.

  **Note:** If idoesn't work check the following parameter is set to true in `mav_linear_mpc_sim.launch` file

  ```text

  ```

* Record the `/iris/command/roll_pitch_yawrate_thrust` & `/iris/imu` topics using rosbag.
* Refer [ethz-asl/mav\_system\_identification](https://github.com/ethz-asl/mav_system_identification) & [mav\_dji\_ros\_interface wiki](https://github.com/ethz-asl/mav_dji_ros_interface/wiki/Dynamic-System-Identification-%28via-VirtualRC%29) for using the recorded data in matlab and running the matlab plots for system model parameters.

### Update the new parameters <a id="update-the-new-parameters"></a>

* MPC yaml file for iris \(example \`mav\_linear\_mpc/resources/linear\_mpc\_iris.yaml\)

  \`\`\`yaml

  **==================================================================================================================**

  **Project: MPC for multirotor systems.**

  **function: MPC Position controller parameters**

  **Author: Mina Kamel mina.kamel@ethz.ch**

  **Ge:nerated: 03-Apr-2015 13:11:59**

  **==================================================================================================================**

### Controller Parameters: <a id="controller-parameters"></a>

mass: 1.52 roll\_time\_constant: 0.1847 pitch\_time\_constant: 0.175 roll\_gain: 1.017 pitch\_gain: 0.789 drag\_coefficients: \[ 0.010000 , 0.010000, 0.0000\]

q\_x: 40 q\_y: 40 q\_z: 60

q\_vx: 20 q\_vy: 20 q\_vz: 25

q\_roll: 20 q\_pitch: 20

r\_roll: 35 r\_pitch: 35 r\_thrust: 2

r\_droll: 0.3 r\_dpitch: 0.3 r\_dthrust: 0.0025

roll\_max: deg\(25.0\) pitch\_max: deg\(25.0\) yaw\_rate\_max: deg\(90\) thrust\_min: 5 thrust\_max: 20

K\_yaw: 1.8

Ki\_xy: 0.2 Ki\_z: 0.3 position\_error\_integration\_limit: 2 antiwindup\_ball: 0.4

enable\_offset\_free : true enable\_integrator : true

sampling\_time: 0.01 \#IMPORTANT: set this equal to the rate of odometry msg prediction\_sampling\_time: 0.1

```text

```

### Show Time!! <a id="show-time"></a>

* Run the following commands on terminal

  ```text

  ```

* Launch the new launch file

  ```text

  ```

* Start `Q ground control` and put the quad in offboard mode
* Increase the odometry topic rates in `mavlink_main.cpp` if data lags.

[  
](https://gajena.gitbook.io/aerial-robotics/temp/setup-your-computer)  


