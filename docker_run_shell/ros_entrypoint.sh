#!/bin/bash
 
set -e

# Ros Humble build
source "/opt/ros/humble/setup.bash"

echo "==============ROS2 Humble Docker Env Ready================"

cd /root/humble_jammy_container

exec "$@"
