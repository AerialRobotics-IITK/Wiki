# Enable offboard mode in PX4

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





