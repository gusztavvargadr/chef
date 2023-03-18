ARG PLATFORM_VARIANT
ARG PLATFORM_VERSION

FROM gusztavvargadr/chef-core:windows-${PLATFORM_VARIANT}-${PLATFORM_VERSION}

ARG CHEF_CLIENT_VERSION=18.1.0

WORKDIR C:/opt/docker/build/

ADD ./build/chef/windows/chef-client.*.ps1 ./

RUN powershell -File ./chef-client.install.ps1 %CHEF_CLIENT_VERSION%

WORKDIR C:/opt/docker/work/

ENTRYPOINT [ "chef-client.bat" ]
CMD [ "--version" ]
