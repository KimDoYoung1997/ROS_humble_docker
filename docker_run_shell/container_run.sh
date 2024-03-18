#!/bin/bash
# Author : Doyoung Kim (https://github.com/KimDoYoung1997)

# Set the project directory (PROJECT_DIR) as the parent directory of the current working directory
PROJECT_DIR=$(dirname "$PWD")

# Move to the parent folder of the project directory
cd "$PROJECT_DIR"

# Print the current working directory to verify the change
echo "Current working directory: $PROJECT_DIR"

# Check if arguments are provided for the image name and tag
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <container_name> <image_name:tag>"
  exit 1
fi

# Assign the arguments to variables for clarity
CONTAINER_NAME="$1"
IMAGE_NAME="$2"

# Launch the nvidia-docker container with the provided image name and tag	 
docker run -it -e "DISPLAY=$DISPLAY" \
           -e NVIDIA_DRIVER_CAPABILITIES=all \
           -e NVIDIA_VISIBLE_DEVICES=all \
           -e "QT_X11_NO_MITSHM=1" \
           -e "XAUTHORITY=$XAUTH" --runtime=nvidia --gpus all \
           --volume="$PROJECT_DIR:/root/humble_jammy_container/" \
           -v "/tmp/.X11-unix:/tmp/.X11-unix:rw" \
           -v /dev/:/dev/ -v /etc/localtime:/etc/localtime:ro -v /etc/timezone:/etc/timezone:ro \
           --net=host --ipc=host --privileged \
           --name "$CONTAINER_NAME" \
           "$IMAGE_NAME" /bin/bash
