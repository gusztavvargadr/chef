FROM chef/chefworkstation:0.12.20

ENV CHEF_LICENSE accept-silent

WORKDIR /opt/docker/

ENTRYPOINT [ "chef" ]
CMD [ "--help" ]
