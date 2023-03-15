ARG PLATFORM_VARIANT
ARG PLATFORM_VERSION

FROM gusztavvargadr/chef-core:linux-${PLATFORM_VARIANT}-${PLATFORM_VERSION}

ARG CHEF_CLIENT_VERSION=17.10.3

WORKDIR /opt/docker/build/

ADD ./build/chef/linux/chef-client.*.sh ./
RUN chmod +x ./chef-client.*.sh

RUN ./chef-client.install.sh $CHEF_CLIENT_VERSION

WORKDIR /opt/docker/work/

ENTRYPOINT [ "chef-client" ]
CMD [ "--version" ]
