cmake_minimum_required(VERSION 3.5)
project(car_meshes)

find_package(ament_cmake_ros REQUIRED)

## Installation...

install(DIRECTORY meshes
    DESTINATION share/${PROJECT_NAME}/
    FILES_MATCHING PATTERN "*.dae" PATTERN "*.png" PATTERN "*.stl")

ament_package()
