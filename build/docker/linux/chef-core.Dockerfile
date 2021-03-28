FROM ubuntu:20.04

WORKDIR /opt/docker/build/
ADD ./build/chef/linux/chef-core.install.sh ./
RUN chmod +x ./chef-core.install.sh
ENV DEBIAN_FRONTEND=noninteractive
RUN ./chef-core.install.sh
ENV CHEF_LICENSE=accept-silent
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

WORKDIR /opt/docker/work/
