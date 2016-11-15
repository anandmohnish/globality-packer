#!/bin/bash

# Bootstrap a machine sufficiently to run Ansible:
#
#  - Updates apt
#  - Installs Python and pip
#  - Install Ansible and git

usage(){
    echo "Environment variable UBUNTU_VERSION not set, quitting!"
    exit 1
}

if [[ -z $UBUNTU_VERSION ]]; then
	usage
fi

echo "Updating apt..."
# apt-get update will fail intermittently during EBS builds; running this twice seems to work
sudo apt-get -qy update
sudo apt-get -qy update

echo "Installing python..."
sudo apt-get install -y python python-dev python-setuptools libffi-dev libssl-dev

echo "Installing pip..."
sudo easy_install pip

echo "Upgrading setuptools and pip..."
sudo pip install -U setuptools
sudo pip install -U pip

echo "Installing Ansible..."
if [[ $UBUNTU_VERSION == "trusty" ]]; then
	sudo pip install 'ansible<2.1.0.0'
elif [[ $UBUNTU_VERSION == "xenial" ]]; then
	sudo pip install ansible
else
	echo "Couldn't install Ansible"
fi

echo "Installing git..."
sudo apt-get install -y git
