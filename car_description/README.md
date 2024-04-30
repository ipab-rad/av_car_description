# Description

In this package is included the physical description of the car and all of the hereby included transformations between links, joints and sensors.

## Instructions

After cloning the repo build the Docker image from the Dockerfile:
`docker build -t av_car_description -f Dockerfile .`

You should then be able to run a Docker container from the image:
`docker run --rm --net host -v /dev/shm:/dev/shm av_car_description`

The Docker container should automatically launch the relevant code.
You should now be able to see the AV TF tree in Foxglove or RViz.

---

However, you can run the docker container interactively to have a look:
`docker run -it --rm --net host -v /dev/shm:/dev/shm av_car_description bash`

Once inside, you can run the main launch file yourself:
`ros2 launch av_car_description car_description.launch.xml`
