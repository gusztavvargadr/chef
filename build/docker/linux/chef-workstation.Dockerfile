FROM gusztavvargadr/chef-core:linux

WORKDIR /opt/docker/build/
ADD ./build/chef/linux/chef-workstation.install.sh ./
RUN chmod +x ./chef-workstation.install.sh
ADD ./lib/ ./lib/
RUN ./chef-workstation.install.sh

WORKDIR /opt/docker/work/
