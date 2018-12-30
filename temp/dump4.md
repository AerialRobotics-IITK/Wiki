# dump4

### transformation\[tf\]-remapping



* old: contains the name of tf that needs to be remapped
* new: new name of tf

  > example
  >
  > \`\`\`shell

   \[{old: /imu, new: /base\_link}\]

&lt;/launch&gt;

\`\`\`

* Subcribed topic

  > /tf\_old \(tf/tfMessage\) Old transform tree. This is usually published by remapping playback of a bag file. You may need to set use\_sim\_time true for the bag file transforms to be accepted.

* Published topics

  > /tf \(tf/tfMessage\) Current transform tree. This is the normal /tf topic.

### PX4 Toolchain Installation

## Basic Toolchain <a id="basic-toolchain"></a>

> Do **NOT** use the convenience Bash scripts provided on the website

Follow the instructions at [PX4 Development Guide](https://dev.px4.io/en/setup/dev_env_linux_ubuntu.html) for Linux \(Ubuntu/Debian\).

We'll be using **NuttX** based hardware, so **AVOID** Snapdragon Flight, Raspberry Pi and Parrot.

### Steps to follow: <a id="steps-to-follow"></a>

* Permission Setup
* Remove the modemmanager
* Common dependencies
* Ninja build system
* FastRTPS installation
* Simulation Dependencies

We'll prefer **Qt Creator** as our IDE.

## mavros <a id="mavros"></a>

Get mavros source from their GitHub repository [here](https://github.com/mavlink/mavros). Fork the repository and refer to its [README](https://github.com/mavlink/mavros/blob/master/mavros/README.md) for installation instructions.[  
](https://gajena.gitbook.io/aerial-robotics/temp/home)

### how the simulation works with SITL



* `Gazebo-->Plugin-->MAVLink-->SITL`
* Installation: follow toolchain setup
* Running the Simulation

  ```text

  ```

  ​![Gazebo UI](https://raw.githubusercontent.com/PX4/Devguide/master/assets/simulation/gazebo.png)​

* This will bring up the PX4 shell:

  \`\`\`shell

  \[init\] shell id: 140735313310464

  \[init\] task name: px4

\| _**/ / / \| \| \|**_**/ / V / / /\| \| \|** / / / /_\| \| \| \| / /^ \_\__ \| \_\| \/ \/ \|\_/

px4 starting.

pxh&gt;

\`\`\`

> type help if you want to know more

[  
](https://gajena.gitbook.io/aerial-robotics/temp/enable-manual-control-in-offboard-mode-px4)  


