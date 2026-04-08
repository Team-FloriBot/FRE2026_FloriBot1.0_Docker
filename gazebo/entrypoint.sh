#!/bin/bash
set -e

if [ -f /opt/venv/bin/activate ]; then
  source /opt/venv/bin/activate
fi

source /opt/ros/jazzy/setup.bash

if [ -f /ws/install/setup.bash ]; then
  source /ws/install/setup.bash
fi

exec "$@"
