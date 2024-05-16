FROM ros:humble-ros-base-jammy AS base

# Switch to much faster mirror for apt processes
ENV OLD_MIRROR archive.ubuntu.com
ENV SEC_MIRROR security.ubuntu.com
ENV NEW_MIRROR mirror.bytemark.co.uk

RUN sed -i "s/$OLD_MIRROR\|$SEC_MIRROR/$NEW_MIRROR/g" /etc/apt/sources.list

# Install key dependencies
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive \
        apt-get -y --quiet --no-install-recommends install \
        ros-"$ROS_DISTRO"-xacro \
        ros-"$ROS_DISTRO"-robot-state-publisher \
        ros-"$ROS_DISTRO"-joint-state-publisher \
        # Install Cyclone DDS ROS RMW
        ros-"$ROS_DISTRO"-rmw-cyclonedds-cpp \
    && rm -rf /var/lib/apt/lists/*

# Setup ROS workspace folder
ENV ROS_WS /opt/ros_ws
WORKDIR $ROS_WS

# Set cyclone DDS ROS RMW
ENV RMW_IMPLEMENTATION=rmw_cyclonedds_cpp

COPY ./cyclone_dds.xml $ROS_WS/

# Configure Cyclone cfg file
ENV CYCLONEDDS_URI=file://${ROS_WS}/cyclone_dds.xml

# -----------------------------------------------------------------------

FROM base AS prebuilt

# Import code from repos
COPY . src/

# Source ROS setup for dependencies and build our code
RUN . /opt/ros/"$ROS_DISTRO"/setup.sh \
    && colcon build --cmake-args -DCMAKE_BUILD_TYPE=Release

# -----------------------------------------------------------------------

FROM base AS dev

# Install basic dev tools (And clean apt cache afterwards)
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive \
        apt-get -y --quiet --no-install-recommends install \
        # Command-line editor
        nano \
        # Ping network tools
        inetutils-ping \
        # Bash auto-completion for convenience
        bash-completion \
    && rm -rf /var/lib/apt/lists/*

# Add sourcing local workspace command to bashrc when running interactively
# Add colcon build alias for convenience
RUN echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> /root/.bashrc && \
    echo 'alias colcon_build="colcon build --symlink-install \
            --cmake-args -DCMAKE_BUILD_TYPE=Release && \
            source install/setup.bash"' >> /root/.bashrc

# Enter bash for clvelopment
CMD ["bash"]

# -----------------------------------------------------------------------

FROM base as runtime

# Copy artifacts/binaries from prebuilt
COPY --from=prebuilt $ROS_WS/install $ROS_WS/install

# Add command to docker entrypoint to source newly compiled code in container
RUN sed --in-place --expression \
      "\$isource \"$ROS_WS/install/setup.bash\" " \
      /ros_entrypoint.sh

# launch ros package
CMD ["ros2", "launch", "av_car_description", "car_description.launch.xml"]
