#!/bin/bash
# ----------------------------------------------------------------
# Build docker dev stage and add local code for live development
# ----------------------------------------------------------------

# Build docker image up to dev stage
DOCKER_BUILDKIT=1 docker build \
    -t av_car_description:latest \
    -f Dockerfile --target dev .

# Run docker image with local code volumes for development
docker run -it --rm --net host \
    -v /dev/shm:/dev/shm \
    -v ./car_description:/opt/ros_ws/src/car_description \
    -v ./car_meshes:/opt/ros_ws/src/car_meshes \
    av_car_description:latest
