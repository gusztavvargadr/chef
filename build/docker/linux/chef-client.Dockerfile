ARG PLATFORM_VARIANT
ARG PLATFORM_VERSION

FROM gusztavvargadr/chef-core:linux-${PLATFORM_VARIANT}-${PLATFORM_VERSION}

WORKDIR /opt/docker/build/

ADD ./build/chef/linux/chef-client.*.sh ./
RUN chmod +x ./chef-client.*.sh

RUN ./chef-client.install.sh

WORKDIR /opt/docker/work/

ENTRYPOINT [ "" ]
CMD [ "bash", "-c", "chef-client --version" ]
