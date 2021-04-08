#!/bin/sh
set -e

curl -Ls https://omnitruck.chef.io/install.sh | bash -s -- -P chef-workstation -v 21.2.292

apt-get -y install git

cd ./lib/test-kitchen/kitchen-docker/
chef gem build --force ./kitchen-docker.gemspec
chef gem install --force --local ./kitchen-docker-2.10.0.gem
cd ../../../