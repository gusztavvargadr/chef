FROM mcr.microsoft.com/windows/servercore:ltsc2019

WORKDIR C:/opt/chocolatey/

RUN powershell -Command iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'));
RUN choco config set cacheLocation C:\tmp\choco

WORKDIR C:/opt/chef/

RUN choco install chef-workstation --confirm --no-progress
ENV CHEF_LICENSE accept-silent

RUN choco install git --confirm --no-progress --package-parameters '"/GitAndUnixToolsOnPath /NoShellIntegration"'

ENTRYPOINT [ "chef-cli.bat" ]
CMD [ "--help" ]
