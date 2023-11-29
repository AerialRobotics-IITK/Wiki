---
description: >-
  This page covers the configuration of ROS MASTER and MULTIMASTER, along with
  instructions on connecting to Wi-Fi using the terminal
---

# Communication Setup

## Ros Master

First we setup the commnunication between the computers. In this one computer is master and remaining computers are slave.

### Setup

First connect all the computers in the same network. Every computer will have their IP assigned in the network in the subnet mask of 24. Check the IP all computer by typing _**ifconfig**_ in the terminal. Note the IP of the master computer. Run the following command in all the slave computer.

```bash
export ROS_MASTER_URI=http://<master's ip>:11311
```

Now, Every computer should also export their own IP. Type the following command in every computer.

```bash
export ROS_IP=<own ip>
```

To check everything is setup, type the following commands.

```bash
echo $ROS_MASTER_URI
echo $ROS_IP
```

Now, everything is established. You can now run the _**roscore**_ on the master computer. Now you can run nodes on computer and view their topics on any computer.

#### Example

I am running talker on one computer

```bash
rosrun rospy_tutorials talker
```

Check on others computer if this node is running by typing _**rosnode list**_ . This will show talker node running.

Now you can run listener on other computer to see the talker message.

```bash
rosrun rospy_tutorials listener
```

## $${\color{red}Warning}$$

Firewall should be disabled on all the computer for proper communication setup.

You can check it by following command

```bash
sudo ufw status
```

This should show _inactive_. But if it is active, then you have to disable it by following command.

```bash
sudo ufw disable
```

## Multimaster fkie

This is different from ROS Master in a way that in this multiple masters are running and are communicating with each other.

### Master running on same computer(host)

In this we start two ROS master on the same host using different ROS\_MASTER\_URI. Then we start the synchronization to let rostopic pub and rostopic echo communicate together.

#### Setup the environment

In the first console we start the ROS master and an example publisher, which publish Hello World to topic with name /test/topic:

```bash
export ROS_MASTER_URI=http://localhost:11311
roscore --port 11311 >/dev/null 2>&1 &
rostopic pub /test/topic std_msgs/String 'Hello World' -r 1 &
```

In the second console we start a second ROS master and a rostopic echo to receive the Hello World messages:

```bash
export ROS_MASTER_URI=http://localhost:11312
roscore --port 11312 >/dev/null 2>&1 &
rostopic echo /test/topic &
```

At this moment, no topic is being published on the master at localhost:11312 so rostopic echo command shouldn't print any topic.

#### Download the Required Packages

```bash
sudo apt install ros-noetic-multimaster-fkie
sudo apt install ros-noetic-fkie-master-sync
```

#### Multi-master Synchronization

On the 1st console in the previous section, run the following code

```bash
rosrun fkie_master_discovery master_discovery >/dev/null 2>&1 &
rosrun fkie_master_sync master_sync >/dev/null 2>&1 &
```

Do exactly the same on the 2nd console:

```bash
rosrun fkie_master_discovery master_discovery >/dev/null 2>&1 &
rosrun fkie_master_sync master_sync >/dev/null 2>&1 &
```

Now both ROS masters are synchronized, and the 2nd console should start printing the message ('Hello World') being published on the ROS master at localhost:11311 on the 1st console.

### Master running on different computers(hosts)

In this we will start two ROS masters on two different hosts

First, we will make sure we have the correct settings enabled. After that we will register the hostnames of the machines so that the two hosts can identify each other.

#### Enable the network settings

We will need to make sure two settings are working: IP forwarding and multicasting should be enabled. We can check if IP forwarding is enabled by executing the following command in a console on both hosts:

```bash
cat /proc/sys/net/ipv4/ip_forward
```

If this command returns 1 then IP forwarding is enabled. If it is not you can temporarily enable it using:

```bash
sudo sh -c "echo 1 >/proc/sys/net/ipv4/ip_forward"
```

To find out whether multicasting is enabled you can execute the following command:

```bash
cat /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
```

If this command returns 0 then multicasting is enabled. If it is not you can temporarily enable it using:

```bash
sudo sh -c "echo 0 >/proc/sys/net/ipv4/icmp_echo_ignore_broadcasts"
```

Now you can test the network setup utilizing the code from the first example on two machines. The nodes should be able to discover each other but a warning is expected: "Master discovered with not known hostname". You cannot yet send messages from one host to the other.

#### Set the necessary hostname information

Linux keeps a file that contains information on the IP addresses that the computer can connect to and their respective hostnames. This file can be found under /etc/hosts. The warning that we got in the previous subsection told us that the computer found an IP address for which no host was set. We will do that now.

You can discover the hostname of a computer and the corresponding IP address by executing the following commands:

```bash
hostname
hostname -I
```

Now we need to specify the IP and corresponding hostname in each host for the other host. Simply add a line to the /etc/hosts file in each host containing the IP address and the hostname seperated by a tab (you will need administrator rights for this).

```bash
sudo nano /etc/hosts
```

Running the aforementioned commands should now allow you to send messages from one host to the other!

## Connecting to WiFi through terminal

### Check Your Wireless Interface Name

First, we need to identify the network devices that we are going to use to connect to our wifi network. We can list our interfaces with the following command

```bash
iwconfig
```

Interface should be like that starts with "wlan" or "wlp1s0". This is your wireless interface name.

Now check the WiFi radio status with the following command.

```bash
nmcli radio wifi 
```

This should show enabled. If this is disabled then enable it by

```bash
nmcli radio wifi on
```

You can check the status of your network interface cards with

```bash
nmcli dev status
```

If your wifi card is hard blocked on your Laptop/Computer, you need to execute the following commands and repeat the above steps

```bash
echo "blacklist hp_wmi" | sudo tee /etc/modprobe.d/hp.conf
sudo rfkill unblock all
```

### Scan For Available Wifi Networks

We need to scan for available wifi networks with which we can connect to

```bash
nmcli dev wifi list 
```

or

```bash
sudo iw wlp1s0 scan | grep SSID
```

This should list out the names of all the available wifi networks around you.

### Connect To The Wifi Network

You can connect to a network simply by the following command

```bash
sudo nmcli dev wifi connect <network-ssid> password <network-password>
```

or

```bash
sudo nmcli --ask dev wifi connect <SSID>
```
