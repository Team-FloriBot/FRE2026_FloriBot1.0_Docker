FROM ros:jazzy

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    python3-colcon-common-extensions \
    python3-pip \
    git \
    build-essential \
    autoconf \
    automake \
    libtool \
    pkg-config \
    wget \
    ca-certificates \
    libusb-1.0-0-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp

RUN wget -O /tmp/phidget21.tar.gz \
    https://www.phidgets.com/downloads/phidget21/libraries/linux/libphidget/libphidget_2.1.8.20120514.tar.gz && \
    tar -xzf /tmp/phidget21.tar.gz -C /tmp && \
    cd /tmp/libphidget-2.1.8.20120514 && \
    ./configure --prefix=/usr && \
    make -j"$(nproc)" && \
    make install && \
    ldconfig && \
    rm -rf /tmp/phidget21.tar.gz /tmp/libphidget-2.1.8.20120514

WORKDIR /ws

COPY repos/FloriBot1.0_ROS2_Jazzy_Base/ src/

RUN . /opt/ros/jazzy/setup.sh && \
    colcon build

COPY base/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["ros2", "launch", "base", "base_launch.py"]
