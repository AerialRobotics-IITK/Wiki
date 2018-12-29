There are three files
```shell
   1. double.launch # to detect multiple markers
   2. marker_publisher.launch
   3. single.launch # to detect a single marker
```

`single.launch`
```xml
<launch>

    <arg name="markerId"        default="582"/>
    <arg name="markerSize"      default="0.034"/>    <!-- in m -->
    <arg name="eye"             default="left"/>
    <arg name="marker_frame"    default="aruco_marker_frame"/>
    <arg name="ref_frame"       default=""/>  <!-- leave empty and the pose will be published wrt param parent_name -->
    <arg name="corner_refinement" default="LINES" /> <!-- NONE, HARRIS, LINES, SUBPIX -->


    <node pkg="aruco_ros" type="single" name="aruco_single">
        <remap from="/camera_info" to="/stereo/$(arg eye)/camera_info" />
        <remap from="/image" to="/stereo/$(arg eye)/image_rect_color" />
        <param name="image_is_rectified" value="True"/>
        <param name="marker_size"        value="$(arg markerSize)"/>
        <param name="marker_id"          value="$(arg markerId)"/>
        <param name="reference_frame"    value="$(arg ref_frame)"/>   <!-- frame in which the marker pose will be refered -->
        <param name="camera_frame"       value="stereo_gazebo_$(arg eye)_camera_optical_frame"/>
        <param name="marker_frame"       value="$(arg marker_frame)" />
        <param name="corner_refinement"  value="$(arg corner_refinement)" />
    </node>

</launch>
```
* `camera_info needs your calibration parameters`
* `image need image from your camera .... probably \usb_cam\image_raw` 
* Download markers from [here](https://www.google.com/url?q=https://terpconnect.umd.edu/~jwelsh12/enes100/markergen.html&sa=D&source=hangouts&ust=1527022160359000&usg=AFQjCNHeeX8B02g09bn-HMjGZKdVxfNCKw)
* Launch `roslaunch aruco_ros single.launch`