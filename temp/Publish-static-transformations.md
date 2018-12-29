static_transform_publisher x y z yaw pitch roll frame_id child_frame_id period_in_ms
> Publish a static coordinate transform to tf using an x/y/z offset in meters and yaw/pitch/roll in radians. (yaw is rotation about Z, pitch is rotation about Y, and roll is rotation about X). The period, in milliseconds, specifies how often to send a transform. 100ms (10hz) is a good value. 

static_transform_publisher x y z qx qy qz qw frame_id child_frame_id  period_in_ms
> Publish a static coordinate transform to tf using an x/y/z offset in meters and quaternion. The period, in milliseconds, specifies how often to send a transform. 100ms (10hz) is a good value. 

static_transform_publisher is designed both as a command-line tool for manual use, as well as for use within roslaunch files for setting static transforms. For example: 
```shell
<launch>
<node pkg="tf" type="static_transform_publisher" name="link1_broadcaster" args="1 0 0 0 0 0 1 link1_parent link1 100" />
</launch>
```