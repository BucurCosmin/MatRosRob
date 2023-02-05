# MatRosRob
Controlling Robots from Matlab with ROS2

Set of tools for controlling Robots with Matlab and ROS2

Set up
1. Install ROS Humble on a Linux Ubuntu virtual machine
2. Install Universal robots ros2 driver on the same machine (https://github.com/UniversalRobots/Universal_Robots_ROS2_Driver)
3. Install Docker on the linux machine
4. Pull the docker image for Universal Robots (https://hub.docker.com/r/universalrobots/ursim_e-series)

Starting the docker image we'll use the script provided with the UR driver:
ros2 run ur_robot_driver start_ursim.sh -m <ur_type>

Spinning the driver:
ros2 launch ur_robot_driver ur_control.launch.py ur_type:=<ur_type> robot_ip:=192.168.56.101 launch_rviz:=true
