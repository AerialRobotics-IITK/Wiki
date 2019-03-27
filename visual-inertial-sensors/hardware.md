---
description: Hardware required for VIO systems
---

# Hardware

## Camera

* Types of Cameras
  * Based on Shutter type
    * [Rolling Shutter](https://en.wikipedia.org/wiki/Rolling_shutter)
    * [Global Shutter ](https://www.red.com/red-101/global-rolling-shutter)\(Recommended\)
  * Based on Trigger I/O
    * Able to operate with external trigger signal \(Must for VIO\) 

      \(Note: Generally all the cameras, even the low-cost webcam \(VSYNC\) has this feature but the trigger pins are hidden inside the board, while there are cameras which have dedicated ports for trigger. \)
* Links to some cameras
  * [https://www.ptgrey.com/chameleon3-2](https://www.ptgrey.com/chameleon3-2)
  * [https://www.ptgrey.com/firefly-mv-03-mp-mono-usb-20-micron-mt9v022](https://www.ptgrey.com/firefly-mv-03-mp-mono-usb-20-micron-mt9v022)
  * [https://www.matrix-vision.com/USB2.0-single-board-camera-mvbluefox-mlc.html](https://www.matrix-vision.com/USB2.0-single-board-camera-mvbluefox-mlc.html) 

## IMU

There are lots of IMUs available, even the embedded IMUs can be utilised \(eg. We used IMU data from Pixhawk flight controller\).  

* Trigger Capacities

  If your IMU can generate external trigger, it is the best thing you can have Cheers! 

  If not, then you need to set-up external time-sync. This can be done with micro-controller or with software sync.

* Other Important considerations
  * [Random Walk](https://github.com/ethz-asl/kalibr/wiki/IMU-Noise-Model) \(Important\) 
  * Consistent Rates 

    This helps a lot for time-sync between IMU data and camera images. 

## References

* Visual inertial odometry on budget!!

{% embed url="https://riccardogiubilato.github.io/visual/odometry/2017/12/12/Visual-Inertial-Odometry-On-A-Budget.html" %}





