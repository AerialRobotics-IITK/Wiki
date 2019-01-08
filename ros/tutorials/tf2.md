---
description: Some functions of the TF2 ROS library
---

# TF2

## tf-remapping

Here, 

* old: contains the name of tf that needs to be remapped
* new: new name of tf

```markup
<launch>
 
 <!--tf remmapper node-->
  <node pkg="tf" type="tf_remap" name="tf_remapper" output="screen">
    <rosparam param="mappings">
      [{old: /imu, new: /base_link}]
    </rosparam>
  </node>

 <!--node whose tf needs to be remapped-->
  <node pkg="rosbag" type="play" name="player" args="/home/drive/test.bag">
    <remap from="tf" to="tf_old" />
  </node>

</launch>
```

The topic subscribed to is:

**/tf\_old** \(tf/tfMessage\) -- Old transform tree. This is usually published by remapping playback of a bag file. You may need to set use\_sim\_time as true for the bag file transforms to be accepted.

The topic published is:

**/tf** \(tf/tfMessage\) -- Current transform tree. This is the normal /tf topic.

## publish-static-transforms

static\_transform\_publisher x y z yaw pitch roll frame\_id child\_frame\_id period\_in\_ms

> Publish a static coordinate transform to tf using an x/y/z offset in meters and yaw/pitch/roll in radians. \(yaw is rotation about Z, pitch is rotation about Y, and roll is rotation about X\). The period, in milliseconds, specifies how often to send a transform. 100ms \(10hz\) is a good value.

static\_transform\_publisher x y z qx qy qz qw frame\_id child\_frame\_id period\_in\_ms

> Publish a static coordinate transform to tf using an x/y/z offset in meters and quaternion. The period, in milliseconds, specifies how often to send a transform. 100ms \(10hz\) is a good value.

static\_transform\_publisher is designed both as a command-line tool for manual use, as well as for use within roslaunch files for setting static transforms. For example:

```markup
<launch>
<node pkg="tf" type="static_transform_publisher" name="link1_broadcaster" args="1 0 0 0 0 0 1 link1_parent link1 100" />
</launch>
```

