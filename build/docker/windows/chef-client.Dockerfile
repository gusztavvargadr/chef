FROM gusztavvargadr/chef-core:windows

WORKDIR C:/opt/docker/build/

ADD ./build/chef/windows/chef-client.install.ps1 ./

RUN powershell -File ./chef-client.install.ps1

WORKDIR C:/opt/docker/work/
