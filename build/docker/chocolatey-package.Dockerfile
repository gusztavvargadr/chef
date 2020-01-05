FROM mcr.microsoft.com/windows/servercore:ltsc2019

WORKDIR C:/opt/chef/

RUN powershell -Command iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'));

RUN choco install chef-client --confirm --no-progress
ENV CHEF_LICENSE accept-silent

ARG directory
ARG policy

ENV CHEF_EXPORT_DIR C:/opt/chef/.chef/policies/${directory}/${policy}/

ADD ./chocolatey-package.entrypoint.ps1 C:/entrypoint.ps1

ENTRYPOINT [ "powershell", "-File", "C:/entrypoint.ps1" ]
