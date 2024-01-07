ARG PLATFORM_VARIANT
ARG PLATFORM_VERSION

FROM gusztavvargadr/chef-core:windows-${PLATFORM_VARIANT}-${PLATFORM_VERSION}

WORKDIR C:/opt/docker/build/

ADD ./build/chef/windows/chef-client.*.ps1 ./

RUN powershell -File ./chef-client.install.ps1

WORKDIR C:/opt/docker/work/

CMD [ "chef-client.bat", "--version" ]
