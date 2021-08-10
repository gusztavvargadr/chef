FROM gusztavvargadr/chef-workstation:latest

ADD ./ ./

ENTRYPOINT [ "powershell", "-File", "/opt/docker/build/chef-workstation.cookbook-test.ps1" ]
CMD [ "hello-world" ]
