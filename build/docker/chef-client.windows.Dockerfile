FROM gusztavvargadr/chocolatey-cli:windows

WORKDIR C:/opt/chef/
ENV CHEF_LICENSE accept-silent

ADD ./7zip.windows.ps1 ./7zip.ps1
RUN powershell -File .\7zip.ps1

ADD ./chef-client.windows.ps1 ./chef-client.ps1
RUN powershell -File .\chef-client.ps1
