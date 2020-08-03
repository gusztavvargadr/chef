FROM ubuntu:16.04

RUN apt-get update
RUN apt-get -y install curl
RUN apt-get -y install p7zip-full

WORKDIR /opt/docker/chef/
ENV CHEF_LICENSE accept-silent

RUN curl -Ls https://omnitruck.chef.io/install.sh | bash -s -- -P chef -v 16.2.73
