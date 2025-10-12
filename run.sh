docker run --init -it \
  -v /etc/localtime:/etc/localtime:ro \
  -v /etc/timezone:/etc/timezone:ro \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v ./bags:/root/ros2_ws/bags \
  -v ./config:/root/ros2_ws/src/LIO-SAM/config \
  -e DISPLAY=$DISPLAY \
  lio-sam-ros2 \
  tmux