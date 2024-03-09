# Setting up RTK + GPS

**1. Setting up GPS:**

* Connect the 4-pin CAN cable from Here 4 to CAN1 or CAN2 on the flight control. (Note: Ensure firmware compatibility)
* Power the flight control and connect it to Mission Planner.
* In Mission Planner, navigate to Config - Full Parameter List and modify the following parameters:
  * CAN\_D1\_PROTOCOL: 1
  * CAN\_D2\_PROTOCOL: 1
  * CAN\_P1\_DRIVER: 1
  * CAN\_P2\_DRIVER: 1
  * GPS\_TYPE: 9
  * NTF\_LED\_TYPES: 231
* Click "Write Params" after modifications.
* Reboot the autopilot; CAN function should be enabled upon reboot.

**Compass Setting:**

* If there's no safety switch, disable it by modifying BRD\_SAFETYENABLE to 0.
* Alternatively, connect an external safety switch to GPS1 port.
* Note: For Cube orange+, compasses are ordered on the bottom, and the external CAN compass is selected by default.

***

**2. Setting up RTK:**



<figure><img src="../.gitbook/assets/image.jpg" alt=""><figcaption><p>Setup </p></figcaption></figure>

**Ground Side:**

* Connect the base antenna to the base station and then connect the base station module to a computer via USB port.
* Connect the telemetry module to another USB port on the same computer.

**UAV Side:**

* Connect Here 3 / Here 3+ to the CAN interface and the telemetry module to the TELEM interface on the flight control.

**Antenna Placing:**

* Place the RTK antenna in an environment with a clear view of the sky, ideally 30 degrees above the horizon.
* Avoid placing antennas indoors, urban areas, forests, or near the ground.
* Ensure no electronic devices are nearby that may affect the GPS signal.

**Base Module Setting using Mission Planner:**

* Open Mission Planner and navigate to "initial setup → Optional Hardware → RTK/GPS Inject".
* Select the correct base module COM port and click connect.
* Enter the expected absolute geographic accuracy and minimum survey time.
* Click "Restart" to initiate the surveying process.
* Allow time for the base station to meet accuracy requirements.
* After the survey is complete, save the current location in Mission Planner.



<figure><img src="../.gitbook/assets/rtk coplete.jpg" alt=""><figcaption><p>Mission Planner screen after completition of survey.</p></figcaption></figure>

***

**Detailed Documentation:**

For more detailed instructions and information, please refer to the official documentation available at: [Here 3 Manual - RTK Use Operation](https://docs.cubepilot.org/user-guides/here-3/here-3-manual#rtk-use-operation).
