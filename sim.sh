#! /bin/bash


tmux new-window "rosbag play $1"
roslaunch lio_sam run.launch
