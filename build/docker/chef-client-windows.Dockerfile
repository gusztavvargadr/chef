FROM mcr.microsoft.com/windows/servercore:ltsc2019

WORKDIR C:/opt/chef/

RUN powershell -Command iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'));

RUN choco install --confirm chef-client
ENV CHEF_LICENSE accept-silent

ENTRYPOINT [ "C:/opscode/chef/bin/chef-client.bat" ]
CMD [ "--help" ]
