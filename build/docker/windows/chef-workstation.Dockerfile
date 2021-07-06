FROM gusztavvargadr/chef-core:windows

WORKDIR C:/opt/docker/build/

ADD ./build/chef/windows/chef-workstation.install.ps1 ./
ADD ./lib/ ./lib/

RUN powershell -File ./chef-workstation.install.ps1

WORKDIR C:/opt/docker/work/
