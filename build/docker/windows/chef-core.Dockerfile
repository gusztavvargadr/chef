FROM mcr.microsoft.com/windows/servercore:1809

WORKDIR C:/opt/docker/build/

ADD ./build/chef/windows/chef-core.install.ps1 ./

RUN powershell -File ./chef-core.install.ps1

ENV CHEF_LICENSE=accept-silent

WORKDIR C:/opt/docker/work/
