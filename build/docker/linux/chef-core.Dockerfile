ARG LINUX_VARIANT
ARG LINUX_VERSION

FROM ${LINUX_VARIANT}:${LINUX_VERSION}

WORKDIR /opt/docker/build/

ADD ./build/chef/linux/chef-core.*.sh ./
RUN chmod +x ./chef-core.*.sh

RUN ./chef-core.install.sh

ENV CHEF_LICENSE=accept-silent
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

WORKDIR /opt/docker/work/
