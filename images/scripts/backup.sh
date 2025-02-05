#!/bin/bash
set -euxo pipefail

## Install Debian packages
BASE_PKGS="build-essential ccache g++ gawk git make wget valgrind screen procps"
SITL_PKGS="libtool libxml2-dev libxslt1-dev python3-dev python3-pip python3-setuptools python3-numpy python3-pyparsing python3-psutil"
MAVPROXY_PKGS="python3-opencv python3-wxgtk4.0 python3-matplotlib python3-lxml python3-pygame"

apt-get update && apt-get install -y $BASE_PKGS $SITL_PKGS $MAVPROXY_PKGS

## Install Python packages
# Create Python virtual environment for SITL and activate it
python -m venv $VENV
source $VENV/bin/activate

# Install build-time dependencies
python -m pip install --progress-bar off packaging setuptools wheel

# Install SITL and MAVProxy dependencies
python -m pip install --progress-bar off future lxml pymavlink pyserial MAVProxy pexpect geocoder empy==3.3.4 ptyprocess dronecan PyYAML

