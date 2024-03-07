cmake_minimum_required(VERSION 3.5)
project(car_meshes)

find_package(ament_cmake_ros REQUIRED)

## Installation...

install(DIRECTORY meshes/
    DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}/meshes
    FILES_MATCHING PATTERN "*.dae" PATTERN "*.png")

ament_package()