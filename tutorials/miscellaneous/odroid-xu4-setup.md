---
description: Setting up the Odroid.
---

# Odroid XU4 Setup

## Source:

{% embed url="https://wiki.odroid.com/odroid-xu4/odroid-xu4" %}

## Components Required: <a href="#components-required" id="components-required"></a>

* Odroid XU4
* LAN Cable
* USB Wireless Adapter
* eMMC/Micro SD card
* Router (Switching Hub, DHCP network)
* PC
* Monitor TV with HDMI Port _(Optional)_

### Step 1: Software Setup <a href="#step-1-software-setup" id="step-1-software-setup"></a>

{% hint style="info" %}
Note that a few eMMCs and microSD cards available for Odroid come with preloaded OS: in such a case this step may be skipped.
{% endhint %}

Follow these steps to install an OS for your Odroid:

#### 1. Download the image file:&#x20;

Odroid OS have separate kernels, so download an image from the following link:

{% embed url="https://wiki.odroid.com/odroid-xu4/os_images/os_images" %}

**2. Flashing the OS:**

Download Etcher from the following link and use it to flash the eMMC/microSD card with the OS:

{% embed url="https://etcher.io" %}

### **Step 2: Hardware Setup**

{% tabs %}
{% tab title="Monitor Available" %}
Insert the flashed eMMC/microSD card in the respective slot as shown in this video:

{% embed url="https://www.youtube.com/watch?v=xxl4ORk4SJo#action=share" %}

Connect the Odroid to a router via LAN. Connect your PC to the same router/network.
{% endtab %}

{% tab title="No Monitor Available" %}
Insert the flashed eMMC/microSD card in the respective slot as shown in this video:

{% embed url="https://www.youtube.com/watch?v=xxl4ORk4SJo#action=share" %}

For a GUI based procedure, follow this link:

{% embed url="https://com.odroid.com/sigong/blog/blog_list.php?bid=187" %}

For a console based procedure, run the following commands on your Linux terminal:

```bash
sudo apt-get install nmap
nmap -sn 192.168.100.0/24
arp -a | grep 00:1e:06
```

The first IP address in the output is the address of your Odroid. If xxx.xxx.xxx.xxx is this address, run:

```bash
ssh odroid@xxx.xxx.xxx.xxx
```

You would be prompted for a password, enter **odroid**.

{% hint style="success" %}
Odroid terminal accessed.
{% endhint %}
{% endtab %}
{% endtabs %}

[  \
](https://gajena.gitbook.io/aerial-robotics/temp/references)
