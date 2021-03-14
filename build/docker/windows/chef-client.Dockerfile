FROM gusztavvargadr/chef-core:windows

RUN powershell -File ./build/chef-client.ps1
ENV CHEF_LICENSE=accept-silent

WORKDIR C:/opt/docker/work/
