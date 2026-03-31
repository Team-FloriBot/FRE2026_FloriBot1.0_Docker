FROM ros:jazzy

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    python3-colcon-common-extensions \
    python3-pip \
    python3-venv \
    git \
    ros-jazzy-rmw-cyclonedds-cpp \
    && rm -rf /var/lib/apt/lists/*

RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

RUN pip install --no-cache-dir fastapi uvicorn

WORKDIR /ws

COPY repos/Webteleop_ROS2_Jazzy_V1/ src/

RUN . /opt/ros/jazzy/setup.sh && \
    colcon build

COPY webteleop/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["ros2", "run", "web_teleop", "webteleop_node"]
