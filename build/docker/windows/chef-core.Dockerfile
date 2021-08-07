ARG WINDOWS_VARIANT
ARG WINDOWS_VERSION

FROM mcr.microsoft.com/windows/${WINDOWS_VARIANT}:${WINDOWS_VERSION}

WORKDIR C:/opt/docker/build/

ADD ./build/chef/windows/chef-core.*.ps1 ./

RUN powershell -File ./chef-core.install.ps1

ENV CHEF_LICENSE=accept-silent

WORKDIR C:/opt/docker/work/
