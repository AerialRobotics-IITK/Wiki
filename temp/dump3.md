# dump3

### publish-static-transformations

static\_transform\_publisher x y z yaw pitch roll frame\_id child\_frame\_id period\_in\_ms

> Publish a static coordinate transform to tf using an x/y/z offset in meters and yaw/pitch/roll in radians. \(yaw is rotation about Z, pitch is rotation about Y, and roll is rotation about X\). The period, in milliseconds, specifies how often to send a transform. 100ms \(10hz\) is a good value.

static\_transform\_publisher x y z qx qy qz qw frame\_id child\_frame\_id period\_in\_ms

> Publish a static coordinate transform to tf using an x/y/z offset in meters and quaternion. The period, in milliseconds, specifies how often to send a transform. 100ms \(10hz\) is a good value.

static\_transform\_publisher is designed both as a command-line tool for manual use, as well as for use within roslaunch files for setting static transforms. For example:

```text

```

### Odroid XU4 Setup

​[Source: ODROID XU4 WIKI](https://wiki.odroid.com/odroid-xu4/odroid-xu4)​

## **Components Required** <a id="components-required"></a>

* ODROID XU4
* Lan Cable
* USB Wireless Adapter
* eMMC/micro SD card
* Router\(switching Hub, DHCP network\)
* PC
* Monitor/TV with Hdmi Port \(Optional\)

### Step-1 Software Setup <a id="step-1-software-setup"></a>

The first step is to install an OS for your ODROID. Please note that few eMMCs and microSD cards available for ODROID comes with preloaded OS; in such a case this step may be skipped.\

* **Downloading The image file**\

  ODROID OS have separate kernels so get an image file from [this link](https://wiki.odroid.com/odroid-xu4/os_images/os_images).

* **Flashing the OS**\

  Use [Etcher](https://etcher.io/) to flash the microSD card or the eMMC with the OS.

  **Step-2 Hardware Setup**

  **Monitor available**

* Insert the flashed eMMC or microSD card in the respective slot as shown in this [video](https://www.youtube.com/watch?v=xxl4ORk4SJo#action=share).
* Connect the ODROID with lan/wifi adapter and **Congratulations!** you are done.

  **Monitor NOT available**

* Insert the flashed eMMC or microSD card in the respective slot as shown in this [video](https://www.youtube.com/watch?v=xxl4ORk4SJo#action=share). Follow this video till eMMC/microSD connection.
* Connect the ODROID to a router via lan.
* Connect your PC to the same router\(either wirelessly or wired\)
* Getting the IP address of your ODROID.
  * GUI method\

    Follow [this](https://com.odroid.com/sigong/blog/blog_list.php?bid=187).

  * Console method\

    Run following commands on Linux terminal after intalling **NMAP**\

    `nmap -sn 192.168.100.0/24`\

    `arp -a | grep 00:1e:06`\

     The first address will be the IP address of your ODROID for the particular network.\

     **LOGIN via SSH**\

     Type ssh odroid@xxx.xxx.xxx.xxx ; where xxx.xxx.xxx.xxx is the IP address obtained above.\

     It would prompt for a password; **odroid** is the default password.\

     **Congratulations!** ODROID terminal is accessed.

[  
](https://gajena.gitbook.io/aerial-robotics/temp/references)  


