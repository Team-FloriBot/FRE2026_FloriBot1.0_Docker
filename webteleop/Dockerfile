FROM ros:jazzy

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    python3-colcon-common-extensions \
    python3-pip \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install fastapi uvicorn

WORKDIR /ws

COPY repos/Webteleop_ROS2_Jazzy_V1/ src/

RUN . /opt/ros/jazzy/setup.sh && \
    colcon build

COPY webteleop/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["ros2", "run", "web_teleop", "webteleop_node"]
