FROM mcr.microsoft.com/windows/servercore:ltsc2019

WORKDIR C:/opt/chocolatey/

RUN powershell -Command iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'));
RUN choco config set cacheLocation C:\tmp\choco

RUN choco install chef-client --confirm --no-progress
ENV CHEF_LICENSE accept-silent

ENTRYPOINT [ "C:/opscode/chef/bin/chef-client.bat" ]
CMD [ "--help" ]
