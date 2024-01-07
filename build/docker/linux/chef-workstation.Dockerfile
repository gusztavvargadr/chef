ARG PLATFORM_VARIANT
ARG PLATFORM_VERSION

FROM gusztavvargadr/chef-core:linux-${PLATFORM_VARIANT}-${PLATFORM_VERSION}

WORKDIR /opt/docker/build/

ADD ./build/chef/linux/chef-workstation.*.sh ./
RUN chmod +x ./chef-workstation.*.sh

RUN ./chef-workstation.install.sh

WORKDIR /opt/docker/work/

CMD [ "chef", "--version" ]
