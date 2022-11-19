#!/bin/sh
set -e

curl -Ls https://omnitruck.chef.io/install.sh | bash -s -- -P chef-workstation -v $1

apt-get -y install git
