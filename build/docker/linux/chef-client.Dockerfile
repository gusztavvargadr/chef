FROM gusztavvargadr/chef-core:linux

RUN ./build/chef-client.sh
ENV CHEF_LICENSE=accept-silent

WORKDIR /opt/docker/work/
