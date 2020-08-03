FROM gusztavvargadr/chocolatey-cli:windows

WORKDIR C:/opt/chef/
ENV CHEF_LICENSE accept-silent

COPY ./git.windows.ps1 C:/tmp/
RUN powershell -File C:/tmp/git.windows.ps1

COPY ./chef-workstation.windows.ps1 C:/tmp/
RUN powershell -File C:/tmp/chef-workstation.windows.ps1
