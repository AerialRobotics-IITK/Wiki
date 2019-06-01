---
description: How To ROS.
---

# Node Handles, Parameters, and Topics

## Topic naming, node naming, namespacing

First, read the [Naming](http://wiki.ros.org/Names) overview on the ROS Wiki, as it will clear up a lot of questions about private/public/relative namespaces. Second, **never use global namespaces for topic names**.

#### Why namespaces?

Each of our quadrotors runs all its nodes and topics in its own namespace. This makes it easier to see \(1\) which quadrotor something is running on, and \(2\) makes it possible to run several quadrotors at the same time. This is absolutely essential for any collaborative missions with the quadrotors, so _**all nodes have to stick to the namespacing conventions**_.

#### ROS topic names:

No global names. This is because they do not resolve properly when you push nodes into namespaces, and does not allow you to run more than one of your node at a time properly. Or use multiple robots on the same master. Basically just creates a world of problems.

**Good**: `odometry`, `binary_map`, `cam0/camera_info`  
 **Bad**: `/odometry`, `/binary_map`, `/helicopter/cam0/camera_info`

If you want to use a namespace, prefer to actually namespace the node handle on which the publisher is created.

#### Node Handles

There are 4 main types of node handles:

1. Default \(public\) node handle - `nh_ = ros::NodeHandle();`
2. Private node handle - `nh_private_ = ros::NodeHandle("~");`
3. Namespaced node handle - `nh_aslam_ = ros::NodeHandle("aslam");`
4. Global node handle - `nh_global_ = ros::NodeHandle("/");` - you probably shouldn't use this **ever**.

Generally you will only use the first 2 - you could also use the namespaced node handle for separating out publishers for nodes that have many.

To explain what these do and how they should be used, let's assume your ROS node is named `ros_node`, in namespace `blah`, and you are trying to look up the name `topic`. Here is what they will resolve to using all 3 nodehandles:

1. `/blah/topic`
2. `/blah/ros_node/topic`
3. `/blah/aslam/topic`
4. `/topic`

If, instead, your try to resolve `/topic`, this will skip the namespace of the node and resolve to `/topic`.

#### When to use which Node Handle

These are just general guidelines, but when possible, prefer to use the following in each case:

*  **Subscribers** - usually public node handles.
*  **Publishers** - usually private node handles for most output/visualization, occasionally necessary to use public for globally-used data \(i.e., `/odom` topic\).
*  **Parameters** - almost always private node handle.

## Parameters

If a node \(or the underlying libraries\) have configurations that can be set at startup, expose them as ROS parameters. Your parameters should `be_named_like_this`.

It is important to provide reasonable defaults for your params. Prefer to make them member variables in a class, and set them to the correct value in the constructor.

Then you can read new values for them from the parameter file if they have been specified.

