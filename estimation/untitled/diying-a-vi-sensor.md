---
description: Build your own VI sensor framework.
---

# DIYing a VI-Sensor

Due to the limited availability of quality VI sensors, most people who need tightly synchronized visual inertial data have to put one together themselves. This guide gives a general overview of what is important in getting a sensor up and running, before giving specific instructions and code for a sensor using a pixracer and point-grey camera.

### Overview

![Sensor layout](https://camo.githubusercontent.com/0a55f698b2bfb21c43e9cf71bebf5f6828cab2d0/68747470733a2f2f692e696d6775722e636f6d2f4256743964384e2e706e67)

The idea behind the sensor is very simple. As a computers OS prevents sub-millisecond accurate timing, a micro-controller is used. The micro-controller gets data from an IMU and uses a trigger-line to control when a camera takes the images. It then transmits this information to the computer where it can be associated with the received images.

