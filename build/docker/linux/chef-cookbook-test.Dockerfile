FROM gusztavvargadr/chef-workstation:latest

ADD ./ ./

ENTRYPOINT [ "/opt/docker/build/chef-workstation.cookbook-test.sh" ]
CMD [ "hello-world" ]
