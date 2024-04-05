#!/bin/sh
set -e

CHEF_CLIENT_VERSION="18.4.12"

curl -Ls https://omnitruck.chef.io/install.sh | bash -s -- -P chef -v $CHEF_CLIENT_VERSION
