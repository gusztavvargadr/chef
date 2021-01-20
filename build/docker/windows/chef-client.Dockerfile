FROM mcr.microsoft.com/windows/servercore:20H2

WORKDIR C:/opt/docker/
ADD ./build/chef/windows/ ./build/

RUN powershell -File ./build/chef-core.ps1

RUN powershell -File ./build/chef-client.ps1
ENV CHEF_LICENSE=accept-silent

WORKDIR C:/opt/docker/work/
ENTRYPOINT [ "chef-client.bat" ]
CMD [ "--version" ]

