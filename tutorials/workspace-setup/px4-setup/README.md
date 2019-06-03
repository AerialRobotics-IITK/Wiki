---
description: Installing firmware for the PixHawk.
---

# PX4 Setup

## Step 1: Install QGC

Download the QGroundControl package from the following link:

{% embed url="https://s3-us-west-2.amazonaws.com/qgroundcontrol/builds/master/QGroundControl.tar.bz2" caption="" %}

Extract the downloaded archive by running the following in the terminal

{% hint style="warning" %}
First navigate to the folder where the download is stored.
{% endhint %}

```bash
tar jxf QGroundControl.tar.bz2
cd qgroundcontrol
./qgroundcontrol-start.sh
```

## Step 2: Install the Toolchain

Follow the instructions here to install the PX4 toolchain:

{% page-ref page="px4-toolchain-setup.md" %}

## Step 3: Building the software

Run the following in the terminal:

```bash
# creates install directory. Change this if required.
mkdir -p ~/src
cd ~/src

# download Firmware
git clone https://github.com/PX4/Firmware.git
cd Firmware

# building
make px4fmu-v2_default

# upload to board
make px4fmu-v2_default upload
```

For a more detailed and extensive build, check this:

{% embed url="https://dev.px4.io/en/setup/building\_px4.html" caption="" %}

