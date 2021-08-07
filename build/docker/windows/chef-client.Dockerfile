ARG WINDOWS_VARIANT
ARG WINDOWS_VERSION

FROM gusztavvargadr/chef-core:windows-${WINDOWS_VARIANT}-${WINDOWS_VERSION}

ARG CHEF_CLIENT_VERSION

WORKDIR C:/opt/docker/build/

ADD ./build/chef/windows/chef-client.*.ps1 ./

RUN powershell -File ./chef-client.install.ps1 %CHEF_CLIENT_VERSION%

WORKDIR C:/opt/docker/work/
