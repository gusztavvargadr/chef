FROM mcr.microsoft.com/windows/servercore:ltsc2019

RUN powershell -Command iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'));

RUN choco install chef-client --confirm --no-progress
ENV CHEF_LICENSE accept-silent

WORKDIR C:/opt/docker/

ENTRYPOINT [ "C:/opscode/chef/bin/chef-client.bat" ]
CMD [ "--help" ]
