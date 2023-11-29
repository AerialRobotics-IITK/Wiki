# QGroundControl

## For Window's peeps

_QGroundControl_ can be installed on 64 bit versions of Windows:

1. Download [QGroundControl-installer.exe](https://d176tv9ibo4jno.cloudfront.net/latest/QGroundControl-installer.exe).
2. Double click the executable to launch the installer.

{% hint style="warning" %}
The Windows installer creates 3 shortcuts: **QGroundControl**, **GPU Compatibility Mode**, **GPU Safe Mode**. Use the first shortcut unless you experience startup or video rendering issues
{% endhint %}

## For Linux's peeps

_QGroundControl_ can be installed/run on Ubuntu LTS 20.04 (and later).

Ubuntu comes with a serial modem manager that interferes with any robotics related use of a serial port (or USB serial). Before installing _QGroundControl_ you should remove the modem manager and grant yourself permissions to access the serial port. You also need to install _GStreamer_ in order to support video streaming.

1.  On the command prompt enter:

    ```bash
    sudo usermod -a -G dialout $USER
    sudo apt-get remove modemmanager -y
    sudo apt install gstreamer1.0-plugins-bad gstreamer1.0-libav gstreamer1.0-gl -y
    sudo apt install libqt5gui5 -y
    sudo apt install libfuse2 -y
    ```
2. Logout and login again to enable the change to user permissions.

&#x20; To install _QGroundControl_:

1. Download [QGroundControl.AppImage](https://d176tv9ibo4jno.cloudfront.net/latest/QGroundControl.AppImage).
2.  Install (and run) using the terminal commands:\


    ```bash
    chmod +x ./QGroundControl.AppImage
    ./QGroundControl.AppImage  (or double click)

    ```

\
Boom! You're all ready to roll with QGroundControl!

\


\


\
