---
description: A guide to various connections
---

# Connections

### Pixhawk via TTL/FTDI/Companion cable

![Pixhawk 2 cube pinout](../.gitbook/assets/pix2.1\_carrier\_pinout.png)

Generally, the Pixhawk is connected to the TTL cable via Telem 2 Port. The Pinout for the Telem 2 is given in above image. Connect the VCC and GND of the TTL cable to the VCC and GND of the Telem 2 port (first and last as shown in above fig.). Now connect the MCU\_TX to the Rx port of the TTL cable (generally white) and the MCU\_RX to the Tx port of the TTL cable (generally green). The same configuration works for older pixhawks also.

For other parameter changes refer:

{% embed url="https://dev.px4.io/en/companion_computer/pixhawk_companion.html" %}



