FROM gusztavvargadr/chef-workstation:windows

COPY ./src/ ./src/
COPY ./build/ ./build/
COPY ./samples/cookbooks/ ./samples/cookbooks/
COPY ./samples/policies/ ./samples/policies/

ENTRYPOINT [ "powershell", "-File", "./build/docker/chef-policy-build.entrypoint.ps1" ]
