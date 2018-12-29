* First fork this [repository](https://github.com/PX4/Firmware) for firmware-clone
* Now go to the file `Firmware/src/modules/mc_pos_control_main.cpp`
* Add this 
```c++
//call for function
void manual_control(float dt);

//function itslef
void MulticopterPositionControl::follow_aruco_control(float dt)
{
        _att_sp.pitch_body =- _manual.x * _params.man_tilt_max;
	_att_sp.roll_body = _manual.y * _params.man_tilt_max;
      	matrix::Quatf q_sp = matrix::Eulerf(_att_sp.roll_body, _att_sp.pitch_body, _att_sp.yaw_body);
        q_sp.copyTo(_att_sp.q_d);
         _att_sp.q_d_valid = true;
}

//if offboard enabled take manual control
if (_control_mode.flag_control_offboard_enabled)
{
	manual_control(dt);
}
```