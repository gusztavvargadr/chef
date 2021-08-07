ARG LINUX_VARIANT
ARG LINUX_VERSION

FROM gusztavvargadr/chef-core:linux-${LINUX_VARIANT}-${LINUX_VERSION}

ARG CHEF_CLIENT_VERSION

WORKDIR /opt/docker/build/

ADD ./build/chef/linux/chef-client.*.sh ./
RUN chmod +x ./chef-client.*.sh

RUN ./chef-client.install.sh $CHEF_CLIENT_VERSION

WORKDIR /opt/docker/work/
