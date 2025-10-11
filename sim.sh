#! /bin/bash

roslaunch lio_sam run.launch &
rosbag play $1 -r 3