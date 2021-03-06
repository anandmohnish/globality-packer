#!/bin/bash

# Bootstrap a machine sufficiently to run Ansible:
#
#  - Updates apt
#  - Installs Python and pip
#  - Install Ansible and git

echo "Updating apt..."
# apt-get update will fail intermittently during EBS builds; running this twice seems to work
sudo apt-get -qy update
sudo apt-get -qy update

echo "Installing python..."
sudo apt-get install -y python python-dev python-setuptools libffi-dev libssl-dev

echo "Installing pip..."
sudo easy_install pip

echo "Upgrading setuptools and pip..."
sudo -H pip install -U setuptools
sudo -H pip install -U pip

echo "Upgrading PyOpenSSL..."
sudo -H pip install -U pyopenssl

echo "Installing Ansible..."
sudo -H pip install ansible

echo "Installing git..."
sudo apt-get install -y git
