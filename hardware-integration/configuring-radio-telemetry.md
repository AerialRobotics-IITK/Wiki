# Configuring Radio Telemetry

**Hardware Requirements**

* Radio module with TELEM1 and TELEM2 ports
* Micro USB cable
* Drone with a battery

**Instructions**

1. **Physical Connection:**
   * Connect one of the radios to your computer using the micro USB cable.
   * Power the radio attached to the vehicle by plugging in the vehicle’s battery.
2. **Software Configuration:**
   * Open the Mission Planner and navigate to `Initial Setup | Optional Hardware | SiK Radio` page.
   * Select the correct COM port and set the baud rate to 57600.
   * Ensure the “Connect” button is in a disconnected state.
3. **Load Settings:**
   * Press the `Load Settings` button. Both the Local and Remote areas should fill in with values including the firmware Version.
4. **Change Settings (Optional):**
   * The most common entry to change is the Net ID. The default is 25 for most radios but if you plan to fly in an area with other pilots who may be using the same radio, it is best to change this to another number.
5. **Save Settings:**
   * After making changes, click the `Copy Required Items to Remote` and press `Save Settings`.

**Pin Configuration (TELEM1, TELEM2)**

| Pin     | Signal   | Voltage |
| ------- | -------- | ------- |
| 1 (red) | VCC      | +5V     |
| 2 (blk) | TX (OUT) | +3.3V   |
| 3 (blk) | RX (IN)  | +3.3V   |
| 4 (blk) | CTS      | +3.3V   |
| 5 (blk) | RTS      | +3.3V   |
| 6 (blk) | GND      | GND     |

For detailed instructions and additional information, please refer to the [original documentation](https://ardupilot.org/copter/docs/common-configuring-a-telemetry-radio-using-mission-planner.html).
