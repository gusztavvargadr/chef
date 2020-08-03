FROM gusztavvargadr/chocolatey-cli:windows

WORKDIR C:/opt/chef/
ENV CHEF_LICENSE accept-silent

COPY ./chef-client.windows.ps1 C:/tmp/
RUN powershell -File C:/tmp/chef-client.windows.ps1
