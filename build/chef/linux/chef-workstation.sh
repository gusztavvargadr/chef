#!/bin/sh

apt-get -y install git
curl -Ls https://omnitruck.chef.io/install.sh | bash -s -- -P chef-workstation -v 20.12.187

# cd lib/test-kitchen/kitchen-docker
# chef gem build --force kitchen-docker.gemspec
# chef gem install --force --local kitchen-docker-2.10.0.gem
