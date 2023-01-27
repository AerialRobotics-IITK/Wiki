---
description: Description about Offboard mode of PX4
---

# Offboard mode

In this mode the position, velocity or attitude reference / target / setpoint is provided by a companion computer connected via serial cable and MAVLink. The offboard setpoint can be provided by API like [MAVROS](https://github.com/mavlink/mavros).

Normal mainstream PX4  Firmware uses this message flow and Runs a high-level PID Controller:

### Message Flows

| ROS msg name                    | msg type                    | uses                                       |
| ------------------------------- | --------------------------- | ------------------------------------------ |
| mavros/local\_position/odom     | nav\_msgs::Odometry         | Contains local odometry data               |
| mavros/setpoint\_position/local | geometry\_msgs::PoseStamped | Used in offboard mode for postion setpoint |

### Example

![](<../.gitbook/assets/Untitled presentation (1).png>)

{% embed url="https://github.com/PX4/avoidance#advanced\" %}
For more Info!
{% endembed %}
