#!/bin/bash

sudo ip link set can0 type can bitrate 500000
sudo ip link set can0 up

if [ ! -d /home/autoware/ai-challenge/log ]; then
   mkdir /home/autoware/ai-challenge/log
fi

candump -L can0 > /home/autoware/ai-challenge/log/`date +%Y%m%d-%H-%M-%S`.log & 

source /home/autoware/ai-challenge/Autoware/ros/devel/setup.bash
roslaunch ymc g30esli_interface.launch

sudo ip link set can0 down
