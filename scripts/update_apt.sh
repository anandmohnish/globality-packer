#!/bin/bash

# Update the apt cache before doing anything else.
#
# Note that running `apt-get upgrade` can be a poor idea in a non-interactive environment.

echo "Updating apt..."
# apt-get update will fail intermittently during EBS builds; running this twice seems to work
apt-get -qy update
apt-get -qy update
