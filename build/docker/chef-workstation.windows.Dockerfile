ARG TAG
FROM gusztavvargadr/chocolatey-cli:windows-${TAG}

WORKDIR C:/opt/chef/

ADD ./chef-workstation.windows.ps1 ./chef-workstation.ps1
RUN powershell -File .\chef-workstation.ps1

ENV CHEF_LICENSE accept-silent

# ENTRYPOINT [ "chef-cli.bat" ]
# CMD [ "--help" ]
