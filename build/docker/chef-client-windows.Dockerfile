FROM mcr.microsoft.com/windows/servercore:ltsc2019

WORKDIR C:/opt/gusztavvargadr/chef

ENV CHEF_LICENSE accept-silent

RUN powershell -Command iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'));

RUN choco install --confirm chef-client

ENTRYPOINT [ "C:/opscode/chef/bin/chef-client.bat" ]
CMD [ "--version" ]
