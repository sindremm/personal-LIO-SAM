#! /bin/bash

ros2 launch lio_sam run.launch.py&
ros2 bag play $1