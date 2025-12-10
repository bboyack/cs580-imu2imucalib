#!/bin/bash

set -e

CONTAINER_NAME="lidar_imu_calib"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

BAG_DIR="${HOME}/data_byu/bags"

ROS_IMAGE="ros:humble"

echo "Pulling Docker image $ROS_IMAGE..."
docker pull $ROS_IMAGE

echo "Creating and starting container $CONTAINER_NAME..."

docker run -it \
    --name "$CONTAINER_NAME" \
    -v "$SCRIPT_DIR:/root/lidarimucalib" \
    -v "$BAG_DIR:/root/bags" \
    -w /root/lidarimucalib \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    "$ROS_IMAGE" \
    bash