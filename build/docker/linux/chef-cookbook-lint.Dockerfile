FROM gusztavvargadr/chef-workstation:latest

ADD ./ ./

ENTRYPOINT [ "/opt/docker/build/chef-workstation.cookbook-lint.sh" ]
CMD [ "hello-world" ]
