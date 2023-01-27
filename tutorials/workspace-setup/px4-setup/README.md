---
description: Installing firmware for the PixHawk.
---

# PX4 Setup

## Step 1: Install QGC

Download the QGroundControl AppImage from the following link:

{% embed url="https://d176tv9ibo4jno.cloudfront.net/latest/QGroundControl.AppImage" %}

Extract the downloaded archive by running the following in the terminal

{% hint style="warning" %}
First navigate to the folder where the download is stored.
{% endhint %}

Go to the folder where the AppImage has been downloaded by:

```bash
cd ~
cd Downloads/
chmod +x ./QGroundControl.AppImage
./QGroundControl.AppImage  (or double click)
```

If everything has been done correctly, you should see a window of the world showing.

## Step 2: Install the Toolchain

Follow the instructions here to install the PX4 toolchain:

{% content-ref url="px4-toolchain-setup.md" %}
[px4-toolchain-setup.md](px4-toolchain-setup.md)
{% endcontent-ref %}

## Step 3: Building the software

Run the following in the terminal:

```bash
# creates install directory. Change this if required.
mkdir -p ~/src
cd ~/src

# download Firmware
git clone https://github.com/PX4/Firmware.git
cd Firmware


#The following is what you have to do when you are going to work on a board.... Wait for it   :)
# building
make px4fmu-v2_default

# upload to board
make px4fmu-v2_default upload
```

For a more detailed and extensive build, check this:

{% embed url="https://dev.px4.io/en/setup/building:px4.html" %}
