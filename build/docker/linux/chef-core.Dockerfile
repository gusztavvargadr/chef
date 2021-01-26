FROM ubuntu:20.04

WORKDIR /opt/docker/
ADD ./build/chef/linux/ ./build/
RUN chmod +x ./build/*.sh

ENV DEBIAN_FRONTEND=noninteractive
RUN ./build/chef-core.sh
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8
