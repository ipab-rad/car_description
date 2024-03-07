FROM ros:humble-ros-base-jammy

# Install basic dev tools (And clean apt cache afterwards)
RUN apt update \
    && DEBIAN_FRONTEND=noninteractive \
        apt -y --quiet --no-install-recommends install \
        # Command-line editor
        nano \
        # Base network tools
        inetutils-tools \
    && rm -rf /var/lib/apt/lists/*

# Setup ROS workspace folder
ENV ROS_WS /opt/ros_ws
RUN mkdir -p $ROS_WS/src
WORKDIR $ROS_WS

# Import code from repos
ADD . $ROS_WS/src/

# Install dependencies for all ROS packages found in src
RUN apt update \
    && DEBIAN_FRONTEND=noninteractive \
	&& rosdep install --from-paths $ROS_WS/src --ignore-src -q -r -y \
    && rm -rf /var/lib/apt/lists/*

# Source ROS setup for dependencies and build our code
RUN . /opt/ros/$ROS_DISTRO/setup.sh \
    && colcon build --symlink-install

# Add command to docker entrypoint to source newly compiled code when running docker container
RUN sed --in-place --expression \
      '$isource "$ROS_WS/install/setup.bash"' \
      /ros_entrypoint.sh

# launch ros package
CMD ["ros2", "launch", "car_description", "car_description.launch.xml"]