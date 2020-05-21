ARG TAG
FROM gusztavvargadr/chocolatey-cli:windows-${TAG}

WORKDIR C:/opt/chef/

ADD ./chef-client.windows.ps1 ./chef-client.ps1
RUN powershell -File .\chef-client.ps1

ENV CHEF_LICENSE accept-silent

# ENTRYPOINT [ "chef-client.bat" ]
# CMD [ "--help" ]
