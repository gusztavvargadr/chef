ARG WINDOWS_VARIANT
ARG WINDOWS_VERSION

FROM gusztavvargadr/chef-core:windows-${WINDOWS_VARIANT}-${WINDOWS_VERSION}

ARG CHEF_WORKSTATION_VERSION

WORKDIR C:/opt/docker/build/

ADD ./build/chef/windows/chef-workstation.*.ps1 ./
ADD ./lib/ ./lib/

RUN powershell -File ./chef-workstation.install.ps1 %CHEF_WORKSTATION_VERSION%

WORKDIR C:/opt/docker/work/
