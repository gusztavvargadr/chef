#!/bin/sh
set -e

CHEF_WORKSTATION_VERSION="23.4.1032"

curl -Ls https://omnitruck.chef.io/install.sh | bash -s -- -P chef-workstation -v $CHEF_WORKSTATION_VERSION

apt-get -y -qq update
apt-get -y -qq install git
