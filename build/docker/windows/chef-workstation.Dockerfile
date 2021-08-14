ARG PLATFORM_VARIANT
ARG PLATFORM_VERSION

FROM gusztavvargadr/chef-core:windows-${PLATFORM_VARIANT}-${PLATFORM_VERSION}

ARG CHEF_WORKSTATION_VERSION

WORKDIR C:/opt/docker/build/

ADD ./build/chef/windows/chef-workstation.*.ps1 ./
ADD ./lib/ ./lib/

RUN powershell -File ./chef-workstation.install.ps1 %CHEF_WORKSTATION_VERSION%

WORKDIR C:/opt/docker/work/

ENTRYPOINT [ "chef-cli.bat" ]
CMD [ "--version" ]
