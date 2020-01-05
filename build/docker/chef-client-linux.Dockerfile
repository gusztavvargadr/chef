FROM chef/chefworkstation:0.12.20

WORKDIR /opt/chef/

ENV CHEF_LICENSE accept-silent

ENTRYPOINT [ "chef-client" ]
CMD [ "--help" ]
