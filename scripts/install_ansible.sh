#!/bin/bash

# Install ansible (and its dependencies).
#
# Ansible must be installed on any machine using Packer's "ansible-local" provisioner.
#
# Git is also needed to use ansible-galaxy with git-remote roles.
#
# Dependencies:
#
#   - `install_python.sh`

echo "Installing ansible..."
pip install ansible

echo "Installing git..."
apt-get install -y git
