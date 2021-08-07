ARG LINUX_VARIANT
ARG LINUX_VERSION

FROM gusztavvargadr/chef-core:linux-${LINUX_VARIANT}-${LINUX_VERSION}

ARG CHEF_WORKSTATION_VERSION

WORKDIR /opt/docker/build/

ADD ./build/chef/linux/chef-workstation.*.sh ./
RUN chmod +x ./chef-workstation.*.sh
ADD ./lib/ ./lib/

RUN ./chef-workstation.install.sh $CHEF_WORKSTATION_VERSION

WORKDIR /opt/docker/work/
