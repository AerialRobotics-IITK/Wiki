## how the simulation works with SITL(software in the loop)

* `Gazebo-->Plugin-->MAVLink-->SITL`

* Installation: follow toolchain setup
* Running the Simulation
```shell
cd ~/src/Firmware
make posix_sitl_default gazebo
```
![Gazebo UI](https://raw.githubusercontent.com/PX4/Devguide/master/assets/simulation/gazebo.png)
* This will bring up the PX4 shell:
```shell
[init] shell id: 140735313310464
[init] task name: px4

______  __   __    ___
| ___ \ \ \ / /   /   |
| |_/ /  \ V /   / /| |
|  __/   /   \  / /_| |
| |     / /^\ \ \___  |
\_|     \/   \/     |_/

px4 starting.


pxh> 
```
> type help if you want to know more

 