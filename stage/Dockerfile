FROM ros:jazzy

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    python3-colcon-common-extensions \
    python3-rosdep \
    git \
    ros-jazzy-ackermann-msgs \
    ros-jazzy-rmw-cyclonedds-cpp \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /ws/src

RUN git clone --branch jazzy https://github.com/tuw-robotics/Stage.git && \
    git clone --branch jazzy https://github.com/tuw-robotics/stage_ros2.git

WORKDIR /ws

RUN rosdep init || true
RUN rosdep update
RUN rosdep install --from-paths /ws/src/Stage --ignore-src -r -y
RUN rosdep install --from-paths /ws/src/stage_ros2 --ignore-src -r -y

RUN . /opt/ros/jazzy/setup.sh && \
    colcon build --symlink-install

COPY stage/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["ros2", "launch", "stage_ros2", "demo.launch.py", "world:=cave"]
