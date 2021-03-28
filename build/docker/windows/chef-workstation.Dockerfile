FROM gusztavvargadr/chef-core:windows

WORKDIR C:/opt/docker/build/
ADD ./build/chef/windows/chef-workstation.install.ps1 ./
ADD ./lib/ ./lib/
RUN powershell -File ./chef-workstation.install.ps1
RUN del /s /q *.*

WORKDIR C:/opt/docker/work/
