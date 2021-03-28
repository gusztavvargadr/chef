FROM gusztavvargadr/chef-core:linux

WORKDIR /opt/docker/build/
ADD ./build/chef/linux/chef-client.install.sh ./
RUN chmod +x ./chef-client.install.sh
RUN ./chef-client.install.sh

WORKDIR /opt/docker/work/
