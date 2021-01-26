FROM gusztavvargadr/chef-core:linux

RUN ./build/chef-workstation.sh
ENV CHEF_LICENSE=accept-silent

WORKDIR /opt/docker/work/
