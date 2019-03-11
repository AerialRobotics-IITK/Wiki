---
description: Writing a simple udev rule for identifying a device with a specific name
---

# Writing udev rule

### To check you device connection

```text
dmesg | grep ttyUSB  #or ttyACM as per your device type
```

### Getting the attributes of the connected device

```text
udevadm info --name=/dev/ttyUSBx --attribute-walk  # eg. /dev/ttyACM1
```

### Writing the udev

The following folder is reserved for non-system defined or custom udev rules

> /etc/udev/rules.d

Create the following file

```text
sudo vim /etc/udev/rules.d/my_udev.rules
```

Add a similar line as per the set of unique identification attributes like serial no. or kernel no. available from Step-2 above

```text
SUBSYSTEM=="tty", ATTRS{idVendor}=="1234", ATTRS{idProduct}=="5678", SYMLINK+="your_device_name" 
```

### Restart the service

```text
sudo service udev reload
```

Also reboot your system

### Verify 

Check if the rules really worked!

```text
ls -l /dev/your_device_name  
```

For more info visit

[http://www.reactivated.net/writing\_udev\_rules.html](http://www.reactivated.net/writing_udev_rules.html)

