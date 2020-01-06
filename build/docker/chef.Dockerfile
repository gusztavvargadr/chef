FROM chef/chefworkstation:0.12.20

WORKDIR /opt/docker/

ENV CHEF_LICENSE accept-silent

ENTRYPOINT [ "chef" ]
CMD [ "--help" ]
