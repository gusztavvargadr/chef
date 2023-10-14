#!/bin/sh
set -e

CHEF_CLIENT_VERSION="18.3.0"

curl -Ls https://omnitruck.chef.io/install.sh | bash -s -- -P chef -v $CHEF_CLIENT_VERSION
