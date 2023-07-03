# Connecting lidar-lite through I2C

## Step :1&#x20;

Connect Lidar to the Pixwahk by 6 pin connector to the I2C port by the 3 pin connector .

## Step :2

Connect the  Pixhawk to the laptop and go to vehicle setup -> parameters and set the following parameters:-



* [RNGFND1\_TYPE](https://ardupilot.org/copter/docs/parameters.html#rngfnd1-type) = 3 “LidarLite-I2c”
* [RNGFND1\_MAX\_CM](https://ardupilot.org/copter/docs/parameters.html#rngfnd1-max-cm) = 3500 (the maximum range the lidar can accurately report in cm)
* [RNGFND1\_MIN\_CM](https://ardupilot.org/copter/docs/parameters.html#rngfnd1-max-cm) = 20 (the mininum range the lidar can accurately report in cm)

## Step :3

To check if the lidar is working back to home page and go to  Analyze tools ->Mavlink inspector -> DISTANCE\_SENSOR and if the frequency is non-zero and the current distance is changing upon moving the lidar means the lidar is working properly.

## &#x20;

####
