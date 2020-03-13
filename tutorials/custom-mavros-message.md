# Custom mavros message

## Create custom mavros receiver and sender

The aim is to send signals to servo connected to pixhawk, using ROS node.

* In `mavros_msgs/msg` add custom msg file

{% code title="GripperServo.msg" %}
```text
time frame_stamp		# Timestamp 
float32 servo_setpoint
```
{% endcode %}

* Create `gripper_servo.cpp` in the path `mavros_extras/src/plugins/`. This is the receiver node that listen user input and publish to pixhawk.

{% code title="gripper\_servo.cpp" %}
```cpp
#include <mavros/mavros_plugin.h>
#include <mavros_msgs/GripperServo.h>

namespace mavros
{
namespace extra_plugins
{
class GripperServoPlugin : public plugin::PluginBase
{
public:
    GripperServoPlugin() : PluginBase(),
                                     status_nh("~gripper_servo")
    {
    }

    void initialize(UAS &uas_)
    {
        PluginBase::initialize(uas_);

        status_sub = status_nh.subscribe("gripper_servo", 10, &GripperServoPlugin::status_cb, this);
    }

    Subscriptions get_subscriptions()
    {
        return {/* Rx disabled */};
    }

private:
    ros::NodeHandle status_nh;
    ros::Subscriber status_sub;

    /**
	 * @param req	received GripperServo msg
	 */
    void status_cb(const mavros_msgs::GripperServo::ConstPtr &req)
    {
        mavlink::common::msg::GRIPPER_SERVO gripper{};

        gripper.servo_setpoint = req->servo_setpoint;
        
        UAS_FCU(m_uas)->send_message_ignore_drop(gripper);
    }
};
} // namespace extra_plugins
} // namespace mavros

#include <pluginlib/class_list_macros.h>
PLUGINLIB_EXPORT_CLASS(mavros::extra_plugins::GripperServoPlugin, mavros::plugin::PluginBase)
```
{% endcode %}

* Edit `CMakeList.txt` at

{% tabs %}
{% tab title="mavros\_msgs/CMakeList.txt" %}
```
add_message_files(
....
GripperServo.msg
....
)
```
{% endtab %}

{% tab title="mavros\_extras/CMakeList.txt" %}
```text
add_library(
...
src/plugins/gripper_servo.cpp
...
)
```
{% endtab %}
{% endtabs %}

* Edit `mavros_plugins.xml` inside `mavros_extras/mavros_plugins.xml`

{% code title="mavros\_plugins.xml" %}
```markup
<class name="gripper_servo" type="mavros::extra_plugins::GripperServoPlugin" base_class_type="mavros::plugin::PluginBase">
  	<description>Send servo controls to FCU.</description>
</class>
```
{% endcode %}

* Edit `common.xml` inside `mavlink/message_definitions/v1.0/`

{% code title="common.xml" %}
```markup
<message id="229" name="GRIPPER_SERVO">
   <description> Send gripper control generated from off board cobntroller to on board Pixhawk</description>
   <field type="uint64_t" name="time_usec" units="us">Timestamp (synced to UNIX time or since system boot).</field>
   <field type="float" name="servo_setpoint">actuator controls</field>
</message>
```
{% endcode %}

## **Inside px4**

* Edit `common.xml` inside `Firmware/mavlink/include/mavlink/v2.0/message_definitions/` 

{% code title="common.xml" %}
```markup
 <!--Gripper servo control -->
<message id="229" name="GRIPPER_SERVO">
  <description> Send gripper control generated from off board cobntroller to on board Pixhawk</description>
  <field type="uint64_t" name="time_usec" units="us">Timestamp (synced to UNIX time or since system boot).</field>
  <field type="float" name="servo_setpoint">actuator controls</field>
</message>
```
{% endcode %}

* Remove `common` and `standard` directories from `Firmware/mavlink/include/mavlink/v2.0`
* Generate `standard` and `common` directories using `mavlink-generator` located in ros pkg[`mavlink/pymavlink`](https://github.com/AerialRobotics-IITK/mavlink-gbp-release/blob/ARIITK/mavgenerate.py)

```text
$ python mavgenerate.py
```

```text
At XML, "Browse" to [Firmware/mavlink/include/mavlink/v2.0/message_definitions/standard.xml].
At Out, "Browse" to [Firmware/mavlink/include/mavlink/v2.0].
Select Language "C"
Select Protocol "2.0"
Check Validate
```

* Make uOrb message `Firmware/msg/gripper_servo.msg`

```text
uint64 timestamp
float32 servo_setpoint
```

1. Edit `CMakeList.txt` inside `Firmware/msg/`

```text
set(
...
     gripper_servo.msg
     )
```

1. Edit `mavlink_receiver.h` located at `Firmware/src/modules/mavlink/`

{% code title="mavlink\_receiver.h" %}
```cpp
 #include <uORB/topics/gripper_servo.h>
.....
class MavlinkReceiver
{
 	void handle_message_gripper_servo(mavlink_message_t *msg);
......
 	orb_advert_t _gripper_servo_pub{nullptr};
}
```
{% endcode %}

1. Edit `mavlink_receiver.cpp` located at `Firmware/src/modules/mavlink/`

```cpp
MavlinkReceiver::handle_message(mavlink_message_t *msg)
{
  switch (msg->msgid) {

	case MAVLINK_MSG_ID_GRIPPER_SERVO:
		 handle_message_gripper_servo(msg);
         break;
        ....
}
```

add function

```cpp
void
MavlinkReceiver::handle_message_gripper_servo(mavlink_message_t *msg)
{
    mavlink_gripper_servo_t man;
    mavlink_msg_gripper_servo_decode(msg, &man);

    struct gripper_servo_s key;
    memset(&key, 0, sizeof(key));

    key.timestamp = hrt_absolute_time();
    key.servo_setpoint = man.servo_setpoint;

    if (_gripper_servo_pub == nullptr) {
        _gripper_servo_pub = orb_advertise(ORB_ID(gripper_servo), &key);

    } else {
        orb_publish(ORB_ID(gripper_servo), _gripper_servo_pub, &key);
    }

}
```

