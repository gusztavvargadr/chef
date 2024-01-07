ARG PLATFORM_VARIANT
ARG PLATFORM_VERSION

FROM mcr.microsoft.com/windows/${PLATFORM_VARIANT}:${PLATFORM_VERSION}

WORKDIR C:/opt/docker/build/

ADD ./build/chef/windows/chef-core.*.ps1 ./

RUN powershell -File ./chef-core.install.ps1

ENV CHEF_LICENSE=accept-silent

WORKDIR C:/opt/docker/work/

ENTRYPOINT [ "" ]
CMD [ "cmd", "/c", "ver" ]
