FROM osrf/ros:jazzy-desktop

ENV DEBIAN_FRONTEND=noninteractive

# Basis-Tools und ROS-Abhängigkeiten
RUN apt-get update && apt-get install -y \
    git \
    python3-colcon-common-extensions \
    python3-rosdep \
    python3-vcstool \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# rosdep initialisieren (falls noch nicht geschehen)
RUN rosdep init || true && rosdep update

# Workspace anlegen
WORKDIR /opt/ros_ws/src

# Realsense ROS Wrapper klonen
RUN git clone https://github.com/realsenseai/realsense-ros.git -b ros2-master

# Abhängigkeiten installieren
WORKDIR /opt/ros_ws
RUN apt-get update && \
    rosdep install --from-paths src --ignore-src -r -y

# Build
RUN /bin/bash -c "source /opt/ros/jazzy/setup.bash && colcon build"

# Environment setzen
RUN echo "source /opt/ros/jazzy/setup.bash" >> /root/.bashrc && \
    echo "source /opt/ros_ws/install/setup.bash" >> /root/.bashrc

# Startscript
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["ros2", "launch", "realsense2_camera", "rs_launch.py"]
