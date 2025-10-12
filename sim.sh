#! /bin/bash


tmux new-window "ros2 bag play $1"
ros2 launch lio_sam run.launch.py
