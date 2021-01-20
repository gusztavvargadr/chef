FROM ubuntu:20.04

WORKDIR /opt/docker/
ADD ./build/chef/linux/ ./build/

ENV DEBIAN_FRONTEND=noninteractive
RUN ./build/chef-core.sh
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

RUN ./build/chef-client.sh
ENV CHEF_LICENSE=accept-silent

WORKDIR /opt/docker/work/
ENTRYPOINT [ "chef-client" ]
CMD [ "--version" ]
