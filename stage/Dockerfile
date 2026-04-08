FROM ros:jazzy

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    ros-jazzy-desktop \
    ros-jazzy-rmw-cyclonedds-cpp \
    python3-colcon-common-extensions \
    git \
    && rm -rf /var/lib/apt/lists/*

COPY stage/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash", "-lc", "echo 'Stage container started. Add your stage stack here.' && tail -f /dev/null"]
