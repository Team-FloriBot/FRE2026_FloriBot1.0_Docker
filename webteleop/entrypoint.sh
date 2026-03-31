#!/bin/bash
set -e

source /opt/venv/bin/activate
source /opt/ros/jazzy/setup.bash
source /ws/install/setup.bash

exec "$@"
