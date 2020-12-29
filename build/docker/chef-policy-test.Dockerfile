FROM gusztavvargadr/chef-client:windows

COPY ./build/ ./build/
COPY ./.chef/ ./.chef/

ENTRYPOINT [ "powershell", "-File", "./build/docker/chef-policy-test.entrypoint.ps1" ]
