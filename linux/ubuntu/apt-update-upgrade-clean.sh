#!/bin/bash

# Script to update and upgrade Ubuntu system

echo "Starting system update..."

# Update the package list
sudo apt update

# Upgrade all upgradable packages
sudo apt upgrade -y

# Optionally, run full upgrade
# sudo apt full-upgrade -y

# Optionally, remove unnecessary packages
sudo apt autoremove -y

echo "System update complete."

