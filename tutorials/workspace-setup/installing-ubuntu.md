---
description: The "Developer" OS
---

# Installing Ubuntu

## &#x20;Download ISO file

> The latest stable version of Ubuntu that can support all the software we use is 20.04.

Download the required Ubuntu Desktop disk image file from here:

{% embed url="http://releases.ubuntu.com/20.04/" %}

{% hint style="info" %}
The file is named **ubuntu-20.04.6-desktop-amd64.iso**.
{% endhint %}

## Un-allocate Space

Ubuntu 20.04 requires `~8 GB` for complete disk installation, but you need to have more utilities. A space of `100 GBs` usually suffices, but that's your choice.

If you're planning to use Ubuntu as your primary OS I would highly recommend partitioning your SSD drive, and giving up `150 - 200 GB` space instead.

Refer here to understand how to do this step:

{% embed url="https://www.dummies.com/computers/pcs/how-to-unallocate-a-drive-volume-in-windows/" %}
Steps to unallocate space on windows
{% endembed %}

## Create a bootable USB drive

{% embed url="https://rufus.ie/en/" %}

Install Rufus, and upon starting the application should look like:

<img src="../../.gitbook/assets/image (1).png" alt="" data-size="original">

Insert the external flash drive, Rufus would automatically detect it as _Device._\
Under _Boot Selection_ choose the ISO file downloaded above.\
Leave _Partition Scheme_ and _Target System_ as defaults.\
Start the process.

## Reboot and Change Startup Config

Reboot the system, keeping the startup disk connected, and Enter BIOS Menu.\
Reboot your system, and while it turns on, before your laptop's brand's icon shows up.&#x20;

Repeatedly press the key (Keys to be pressed vary a lot, usually it is`F2`, confirm from ) until the BIOS Menu shows up, something like this:

<img src="../../.gitbook/assets/image (1) (1).png" alt="" data-size="original">

Turn off `UEFI Secure Boot` and `Legacy Boot` (if available) settings.\
Now in the _Boot Device Select Menu_ change the `Boot Order` to USB first.\
More info here:

{% embed url="https://www.tuxedocomputers.com/en/Infos/Help-Support/Help-for-my-device/TUXEDO-Book-BA-series/TUXEDO-Book-BA15/BIOS-settings-for-dual-boot-with-Windows.tuxedo" %}

### Load Ubuntu Installer from Drive

While the USB-drive is connected, use that to load the OS.

Ubuntu Installation wizard will greet you.\
Rest steps should be kept as default unless you know what you're doing.\
The steps where you have to take care are:

* Tick the `Install third party softwares for graphics and Wifi hardware [...]`
* Under Installation Type Menu, choose `Something Else` and under that, use the unallocated partitions you created in Step 2.

#### Allocating Space

Distribute the unallocated space to 3 partitions, `root`, `home` and `swap`(recommended, if low RAM device)\
To create the first partition, the `root` partition, select the free space (the shrinking space from Windows created earlier), and hit on the `+` icon below. On partition settings use the following configurations and hit OK to apply changes:

* Size = at least 15000 MB
* Type for the new partition = Primary
* Location for the new partition = Beginning
* Use as = EXT4 journaling file system
* Mount point = `/`

{% hint style="info" %}
It is recommended to place root partition onto primary partition on MBR scheme disks
{% endhint %}

Create the swap partition using the same steps as above.

* Size = 512 MB to 4 GB
* Type for new partition = Primary
* Location for the new partition = Beginning of this space
* Use as = swap area

Create the home partition using similar steps. Use all the available free space left for the home partition size. The partition settings should look like this:

* Size = all remaining free space
* Type for the new partition = Primary
* Location for the new partition = Beginning
* Use as = EXT4 journaling file system
* Mount point = /home

{% hint style="info" %}
You can allocate more partitions for `/boot`, `/tmp` and `/var`
{% endhint %}

Press `Install Now` after verifying that you're good to go.

## Confirm Installation

Now rebooting should greet you with a GRUB menu, with a choice of going for Ubuntu or Windows booting. More detailed dual-booting tutorial [LINK](https://www.tecmint.com/install-ubuntu-alongside-with-windows-dual-boot/)

Move on to [untitled.md](untitled.md "mention")
