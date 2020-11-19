FROM ubuntu:16.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update

RUN apt-get -y install locales
RUN locale-gen en_US.UTF-8
RUN update-locale LANG=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

RUN apt-get -y install curl
RUN apt-get -y install p7zip-full

WORKDIR /opt/docker/chef/
ENV CHEF_LICENSE accept-silent

RUN curl -Ls https://omnitruck.chef.io/install.sh | bash -s -- -P chef -v 16.6.14
