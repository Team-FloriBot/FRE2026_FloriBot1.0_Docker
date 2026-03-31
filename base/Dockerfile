FROM ros:jazzy

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    python3-colcon-common-extensions \
    python3-pip \
    git \
    libphidget21-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /ws

COPY repos/FloriBot1.0_ROS2_Jazzy_Base/ src/

RUN . /opt/ros/jazzy/setup.sh && \
    colcon build

COPY base/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["ros2", "launch", "base", "base_launch.py"]
