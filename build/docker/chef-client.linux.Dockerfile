FROM chef/chefworkstation:0.17.5

WORKDIR /opt/chef/

ENV CHEF_LICENSE accept-silent

ENTRYPOINT [ "chef-client" ]
CMD [ "--help" ]
