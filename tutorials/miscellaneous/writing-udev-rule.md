---
description: Writing a simple UDev rule for identifying a device with a specific name
---

# Writing a UDev rule

### About UDev:

{% embed url="https://wiki.debian.org/udev" %}

### To check your device connection, run:

```
dmesg | grep ttyUSB  #or ttyACM as per your device type
```

### Getting the attributes of the connected device:

```
udevadm info --name=/dev/ttyUSBx --attribute-walk  # eg. /dev/ttyACM1
```

### Writing the udev:

The following folder is reserved for non-system defined or custom udev rules

> /etc/udev/rules.d

Create the following file:

```
sudo vim /etc/udev/rules.d/my_udev.rules
```

Add a similar line as per the set of unique identification attributes like serial no. or kernel no. available from Step-2 above:

```
SUBSYSTEM=="tty", ATTRS{idVendor}=="1234", ATTRS{idProduct}=="5678", SYMLINK+="your_device_name" 
```

restart the system:

```
sudo service udev reload
```

Also reboot your system.

### Verify:

Check if the rule really worked:

```
ls -l /dev/your_device_name  
```

For more info visit:

{% embed url="https://www.reactivated.net/writing_udev_rules.html" %}
