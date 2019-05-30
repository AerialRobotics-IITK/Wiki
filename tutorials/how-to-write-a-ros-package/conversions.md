# Conversions

My source/sink data is...

### Eigen

To to/from messages, use [**eigen\_conversions**](http://wiki.ros.org/eigen_conversions) \(or [minkindr\_conversions](https://github.com/ethz-asl/minkindr_ros) below\).

* [ROS Documentation](http://docs.ros.org/indigo/api/eigen_conversions/html/namespacetf.html)

Example:

```text
#include <eigen_conversions/eigen_msg.h>

Eigen::Vector3d my_super_cool_vector(1.0, 2.0, 3.0);
geometry_msgs::Point point_msg;
tf::pointEigenToMsg(my_super_cool_vector, point_msg);
super_cool_publisher_.publish(point_msg);
```

To go to/from TF, use [**tf\_conversions**](http://wiki.ros.org/tf_conversions) \(or also [minkindr\_conversions](https://github.com/ethz-asl/minkindr_ros) below\).

* [ROS Documentation](http://docs.ros.org/indigo/api/tf_conversions/html/c++/tf__eigen_8h.html)

Example:

```text
#include <tf_conversions/tf_eigen.h>

Eigen::Vector3d my_super_cool_vector(1.0, 2.0, 3.0);
tf::Vector3 my_super_cool_vector_tf;
tf::vectorEigenToTF(my_super_cool_vector, my_super_cool_vector_tf);
tf::Transform transform;
transform.setOrigin(my_super_cool_vector_tf);
transform_broadcaster_.sendTransform(
    tf::StampedTransform(transform, ros::Time::now(), "map", "world"));
```

#### minkindr \(aslam::Transformation\)

Please use the [**minkindr\_conversions**](https://github.com/ethz-asl/minkindr_ros/minkindr_conversions) package in the [minkindr\_ros](https://github.com/ethz-asl/minkindr_ros) repo. This also wraps some of the Eigen/TF conversions for common datatypes \(`Eigen::Quaterniond`, `Eigen::Vector3d`\), so it is a viable alternative to {tf,eigen}\_conversions in most cases. It also transforms minkindr Transformations back and forth to both messages and TF.

* [Code Documentation - Message](https://github.com/ethz-asl/minkindr_ros/blob/master/minkindr_conversions/include/minkindr_conversions/kindr_msg.h)
* [Code Documentation - TF](https://github.com/ethz-asl/minkindr_ros/blob/master/minkindr_conversions/include/minkindr_conversions/kindr_tf.h)

Example:

```text
#include <minkindr_conversions/kindr_msg.h>
#include <minkindr_conversions/kindr_tf.h>

Eigen::Quaterniond rotation(Eigen::Vector4d::Random());
rotation.normalize();
Eigen::Vector3d position(Eigen::Vector3d::Random());
kindr::minimal::QuatTransformation kindr_transform(rotation, position);

geometry_msgs::Pose msg;
tf::poseKindrToMsg(kindr_transform, &msg);
publisher_.publish(msg);

tf::Transform tf_transform;
tf::transformKindrToTF(kindr_transform, &tf_transform);
transform_broadcaster_.sendTransform(
    tf::StampedTransform(tf_transform, ros::Time::now(), "map", "world"));
```

####  

#### openCV Image

Please use [**cv\_bridge**](http://wiki.ros.org/cv_bridge). This allows very easy conversions to/from ROS messages.

* [ROS Tutorial](http://wiki.ros.org/cv_bridge/Tutorials/UsingCvBridgeToConvertBetweenROSImagesAndOpenCVImages)
* [ROS Documentation](http://docs.ros.org/indigo/api/cv_bridge/html/c++/classcv__bridge_1_1CvImage.html)

Example:

```text
#include <cv_bridge/cv_bridge.h>

const stereo_msgs::DisparityImageConstPtr& msg;  // We got this from a subscription callback.
cv::Mat output_image;
cv_bridge::CvImageConstPtr cv_img_ptr = cv_bridge::toCvShare(msg->image, msg);
// This is a shallow copy.
output_image = cv_img_ptr->image;

cv_bridge::CvImage image_cv_bridge;
image_cv_bridge.header.frame_id = "map";
image_cv_bridge.image = output_image;
publisher_.publish(image_cv_bridge.toImageMsg());
```

