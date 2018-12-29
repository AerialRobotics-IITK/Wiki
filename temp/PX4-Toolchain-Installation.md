## Basic Toolchain

> Do **NOT** use the convenience Bash scripts provided on the website

Follow the instructions at [PX4 Development Guide](https://dev.px4.io/en/setup/dev_env_linux_ubuntu.html) for Linux (Ubuntu/Debian).

We'll be using **NuttX** based hardware, so **AVOID** Snapdragon Flight, Raspberry Pi and Parrot.

### Steps to follow:
* Permission Setup
* Remove the modemmanager
* Common dependencies
* Ninja build system
* FastRTPS installation
* Simulation Dependencies

We'll prefer **Qt Creator** as our IDE.


## mavros

Get mavros source from their GitHub repository [here](https://github.com/mavlink/mavros). Fork the repository and refer to its [README](https://github.com/mavlink/mavros/blob/master/mavros/README.md) for installation instructions.