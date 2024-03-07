# Description

In this package is included the physical description of the car and all of the hereby included transformations between links, joints and sensors.

## XACRO script

The XACRO script may be run to generate a URDF file, which actually contains all of the information to generate a ROS robot model. This is used for visualization (e.g. visible meshes in rviz) as well as for calculating transformations (e.g. when using sensors) and for collision checking (e.g. collision meshes for motion planning.)

The idea is to run the XACRO script during initialization and after sensor calibration, since calibrated sensor poses may be passed to XACRO via arguments.

## URDF file

This file consists of a series of links and joints:

- Links describe the physical properties of each relevant part of the robot model (e.g. geometrical shape, size, colour, etc.)

- Joints describe the connection between links (e.g. fixed, continuous, etc.) and can be "controlled" during runtime.

## Commands

- Generate the urdf file from a given xacro script
'rosrun xacro xacro --inorder wrong.xacro > model.urdf'

- Load and visualize the urdf robot model through rviz, also with joint gui
'roslaunch urdf_tutorial display.launch model:=model.urdf gui:=True'
