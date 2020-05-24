ARG TAG
FROM gusztavvargadr/chocolatey-cli:windows-${TAG}

WORKDIR C:/opt/chef/
ENV CHEF_LICENSE accept-silent

ADD ./7zip.windows.ps1 ./7zip.ps1
RUN powershell -File .\7zip.ps1

ADD ./git.windows.ps1 ./git.ps1
RUN powershell -File .\git.ps1

ADD ./chef-workstation.windows.ps1 ./chef-workstation.ps1
RUN powershell -File .\chef-workstation.ps1
