# dump 5

## Enable manual control in offboard mode\[PX4\]

* First fork this [repository](https://github.com/PX4/Firmware) for firmware-clone
* Now go to the file `Firmware/src/modules/mc_pos_control_main.cpp`
* Add this

  \`\`\`c++

  //call for function

  void manual\_control\(float dt\);

//function itslef void MulticopterPositionControl::follow\_aruco\_control\(float dt\) { \_att\_sp.pitch\_body =- \_manual.x _\_params.man\_tilt\_max; \_att\_sp.roll\_body = \_manual.y_ \_params.man\_tilt\_max; matrix::Quatf q\_sp = matrix::Eulerf\(\_att\_sp.roll\_body, \_att\_sp.pitch\_body, \_att\_sp.yaw\_body\); q\_sp.copyTo\(\_att\_sp.q\_d\); \_att\_sp.q\_d\_valid = true; }

//if offboard enabled take manual control if \(\_control\_mode.flag\_control\_offboard\_enabled\) { manual\_control\(dt\); } \`\`\`[    
](https://gajena.gitbook.io/aerial-robotics/temp/_sidebar)

## camera-calibration

[    
](https://gajena.gitbook.io/aerial-robotics/camera_calibration)

* The `Pinhole` model with three radial and two tangential distortion parameters. This model is standard in OpenCV and ROS. You can use the ROS camera calibration tool: [http://wiki.ros.org/camera\_calibration](http://wiki.ros.org/camera_calibration)​
* Matlab also provides the [simple way](https://in.mathworks.com/help/vision/ug/single-camera-calibrator-app.html) to calibrate your camera
* More info [here!](https://github.com/AerialRobotics-IITK/camera_calibrations/blob/master/README.md)​

## rotation of vector 2D

[    
](https://gajena.gitbook.io/aerial-robotics/temp/launch-files)

* In two dimensions, the standard rotation matrix has the following form:-

  ​![alt text](https://wikimedia.org/api/rest_v1/media/math/render/svg/0166e674df67cf24314537211848adec91813945)​

  * A counterclockwise rotation of a vector through angle θ. The vector is initially aligned with the x-axis.![alt text](https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/Counterclockwise_rotation.png/220px-Counterclockwise_rotation.png)​

    > This rotates column vectors by means of the following matrix multiplication

    ​![alt text](https://wikimedia.org/api/rest_v1/media/math/render/svg/657b520ec337f95a996bc9e77f07401778d272af) ![alt text](https://wikimedia.org/api/rest_v1/media/math/render/svg/ddafa97cf937c752708b51b3ba65d9e4e797e6c5)​

    ​![alt text](https://wikimedia.org/api/rest_v1/media/math/render/svg/50622f9a4a7ba2961f5df5f7e0882983cf2f1d2f)​

## rotation of vector 3D

* In three dimensions:-

  ​![alt text](https://wikimedia.org/api/rest_v1/media/math/render/svg/a6821937d5031de282a190f75312353c970aa2df)​

  > First matrix is rotation matrix for the rotation of vector about x-axis using right-hand rule by theta degree angle, And the definition for x explains other two matrix

