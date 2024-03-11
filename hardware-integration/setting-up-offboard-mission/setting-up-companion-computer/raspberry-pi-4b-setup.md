# Raspberry Pi 4B Setup

This guide outlines the process of setting up a Raspberry Pi onboard companion computer without the need for a mouse or keyboard, using Ubuntu 20.04 Server Image.

#### Flashing OS on the Board

1. **Install rpi-imager**
   * Run `sudo apt install rpi-imager` to install the Raspberry Pi Imager.
   * Insert the microSD card into your computer.
2. **Choose OS and Storage**
   * Open Raspberry Pi Imager and select "Choose OS".
   * Navigate to the Ubuntu 20.04 Server image.
   * Select your microSD card under "Choose Storage".
3. **Configure Settings**
   * Click on the settings icon.
   * Enable "Enable SSH".
   * Set a username and password (e.g., "pi").
   * Configure wireless LAN to connect to your Wi-Fi network.
4. **Write OS to microSD**
   * Click "Write" to write the OS to the microSD card.
5. **Boot the Board**
   * Insert the microSD card into the board.
   * Check the LED status to confirm booting from the card.

#### Setting up Ubuntu Server Image for ARIITK

1.  **Basic Linux Setup**

    ```bash
    sudo apt-get update
    sudo apt-get upgrade
    timedatectl set-local-rtc 1 --adjust-system-clock
    sudo apt-get install git
    ```
2.  **ROS Setup**

    ```bash
    # Setup sources.list
    sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

    # Setup keys
    sudo apt install curl
    curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

    # Installation
    sudo apt update
    sudo apt install ros-noetic-base

    # Initialize rosdep
    sudo apt install python3-rosdep
    sudo rosdep init
    rosdep update

    # Setup environment
    echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
    source ~/.bashrc

    # Fulfill dependencies
    sudo apt install python3-rosinstall python3-rosinstall-generator python3-wstool build-essential
    ```
3.  **MAVROS Setup**

    <pre class="language-bash"><code class="lang-bash"># install some dependencies
    sudo apt install python3-rosinstall python3-rosinstall-generator python3-wstool build-essential

    # install MAVROS
    sudo apt-get install ros-noetic-mavros ros-noetic-mavros-extras

    cd ~/

    wget https://raw.githubusercontent.com/mavlink/mavros/master/mavros/scripts/install_geographiclib_datasets.sh
    sudo chmod a+x install_geographiclib_datasets.sh
    sudo ./install_geographiclib_datasets.sh

    # Install catkin tools
    sudo apt-get install python3-catkin-tools

    # Updating MAVProxy and pymavlink (new versions released now and then)
    sudo pip install --upgrade pymavlink MAVProxy

    #Setup MAVROS to begin communication
    cd ~/

    # Setup MAVROS workspace
    mkdir -p ~/ardupilot_ws/src
    cd ~/ardupilot_ws
    catkin init

    # Create launch file for MAVROS
    cd src
    mkdir launch
    cd launch
    roscp mavros apm.launch apm.launch
    sudo gedit apm.launch #opens a text editor, follow the next command (you can also do it using any other editor of your choice, for eg. by using 'code .' commmand)

    #To proxy to a Ground Control Station like QGC or Mission Planner on ground we just need to modify the first line to &#x3C;arg name="fcu_url" default="udp://:{ground-port}@{ground-hostname}" />. save you file and launch it with-
    <strong>cd ~/ardupilot_ws/src/launch
    </strong>roslaunch apm.launch

    </code></pre>
4.  **QGC Setup**

    To configure QGroundControl for communication with MAVROS:

    1. **Open QGroundControl**
       * Launch QGroundControl on your ground station device.
    2. **Configure UDP Settings**
       * Navigate to 'Application Settings'.
       * Go to the 'Comm Links' tab.
       * Click 'Add' in the options menu.
       * Select 'Type' as 'UDP'.
       * Enter the{ground-port} in "Port" and {ground-hostname} in "Server Addresses (optional)"
    3. **Connect**
       * Click "OK" to save the settings.
       * Click on the "Connect" tab to establish the connection from side menu

    Ensure that your onboard companion computer and ground station are connected to the same LAN setup via a router for proper communication.

**Ensure both the board and the ground station are connected to the same LAN setup for the proxy to work.**

