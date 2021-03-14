FROM mcr.microsoft.com/windows/servercore:20H2

WORKDIR C:/opt/docker/
ADD ./build/chef/windows/ ./build/

RUN powershell -File ./build/chef-core.ps1
