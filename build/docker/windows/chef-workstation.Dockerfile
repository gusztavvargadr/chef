ARG PLATFORM_VARIANT
ARG PLATFORM_VERSION

FROM gusztavvargadr/chef-core:windows-${PLATFORM_VARIANT}-${PLATFORM_VERSION}

WORKDIR C:/opt/docker/build/

ADD ./build/chef/windows/chef-workstation.*.ps1 ./

RUN powershell -File ./chef-workstation.install.ps1

WORKDIR C:/opt/docker/work/

ENTRYPOINT [ "" ]
CMD [ "cmd", "/c", "chef-cli.bat --version" ]
