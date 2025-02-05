#!/bin/bash
set -euxo pipefail

echo "Installing MAVProxy dependencies..."

# Install required Debian packages
sudo apt-get update
sudo apt-get install -y python3-dev python3-opencv python3-wxgtk4.0 python3-pip python3-matplotlib python3-lxml python3-pygame

echo "Installing MAVProxy via pip..."
python3 -m pip install --upgrade --user PyYAML mavproxy

# Add ~/.local/bin to PATH to make mavproxy accessible
echo 'export PATH="$PATH:$HOME/.local/bin"' >> ~/.bashrc
export PATH="$PATH:$HOME/.local/bin"

echo "MAVProxy installation completed!"
echo "Restart your shell or run 'source ~/.bashrc' to apply changes."

