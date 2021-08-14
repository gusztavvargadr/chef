#!/bin/sh
set -e

curl -Ls https://omnitruck.chef.io/install.sh | bash -s -- -P chef-workstation -v $1

apt-get -y install git

cd ./lib/test-kitchen/kitchen-docker/
chef gem build --force ./kitchen-docker.gemspec
chef gem install --force --local --no-user-install ./kitchen-docker-2.11.0.gem
cd ../../../
