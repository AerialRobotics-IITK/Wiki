---
description: How to package.
---

# ROS Package

## package.xml

Use package format 2.0, which removes the distinction between `<run_depend>` and `<build_depend>` and makes this more compact.

Use spaces, 2-wide as indentation.

Example:

```text
<?xml version="1.0"?>
<package format="2">
  <name>mav_local_planner</name>
  <version>0.0.0</version>
  <description>
    Local planner with multiple configurable components for planning
    straight-line paths to waypoints, checking global plans for collisions,
    and doing local obstacle avoidance.
  </description>

  <maintainer email="helenoleynikova@gmail.com">Helen Oleynikova</maintainer>

  <license>BSD</license>

  <buildtool_depend>catkin</buildtool_depend>
  <buildtool_depend>catkin_simple</buildtool_depend>

  <depend>mav_msgs</depend>
  <depend>mav_planning_utils</depend>
  <depend>planner_ompl</depend>
  <depend>planner_base</depend>
  <depend>planning_msgs</depend>
  <depend>roscpp</depend>
  <depend>tf</depend>
</package>
```

## CMakeLists.txt

You should use [catkin\_simple](https://github.com/catkin/catkin_simple) rather than the old-style catkin lists, since they make everything easier. Use spaces, 2-wide as indentation.

A few tips:

*  `catkin_simple(ALL_DEPS_REQUIRED)` will make sure that all dependencies in the package.xml above are found on the system and loaded.
* Make a library called `${PROJECT_NAME}` and link any executables against it.
* If you're outputting messages, this is done automatically by catkin simple. However, if you have executables and messages in the same package \(prefer not to do this, just have a whatever\_msgs package instead\), you need to add this to after your executable/library so that things are built in the right order: `add_dependencies(${PROJECT_NAME} ${${PROJECT_NAME}_EXPORTED_TARGETS})`

See the documentation at the link above, and this example:

```text
cmake_minimum_required(VERSION 2.8.3)
project(mav_local_planner)

find_package(catkin_simple REQUIRED)
catkin_simple(ALL_DEPS_REQUIRED)

add_definitions(-std=c++11)

#############
# LIBRARIES #
#############
cs_add_library(${PROJECT_NAME}
  src/trajectory_sampler.cpp
)

############
# BINARIES #
############
cs_add_executable(local_planner_node
  src/local_planner_node.cpp
)
target_link_libraries(local_planner_node ${PROJECT_NAME})

##########
# EXPORT #
##########
cs_install()
cs_export()
```

##  Folder/file structure

Your package should look something like the example below. See the [ROS Package Documentation](http://wiki.ros.org/Packages) for more details.

Keep in mind:

* Your headers should be in include/PACKAGE\_NAME/header.h
* Your source files should be in the src/ folder.
* Ideally, if you have ROS parameters in your node, you should have the default values and descriptions in a .yaml file in the cfg folder.

```text
mav_local_planner
├── CMakeLists.txt
├── cfg
│   └── default_local_planner_params.yaml
├── include
│   └── mav_local_planner
│       └── trajectory_sampler.h
├── package.xml
└── src
    ├── local_planner_node.cpp
    └── trajectory_sampler.cpp
```

Example **default\_local\_planner\_params.yaml**. Always have units when available!

```text
# This file is meant as an example and explanation of the planning params.
# Everything in the base is for the local planner.
local_planning_horizon: 3 # [sec], how far forward to sample trajectories
trajectory_sampling_dt: 0.01 # [sec], how often to sample the trajectory for the controller.
collision_sampling_dt: 0.1 # [sec], how often to check for collisions along the path.
command_publishing_dt: 1.0 # [sec], how often to publish new commands to position controller.
mpc_prediction_horizon: 30 # [timesteps], how many timesteps ahead to publish in addition to the rate

# What kind of planners, obstacle avoidance, etc. to use.
use_obstacle_avoidance: false
# Whether to publish any new trajectories immediately or wait for start
# service call.
autostart: true
```

