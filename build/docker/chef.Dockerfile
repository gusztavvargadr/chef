FROM chef/chefworkstation:0.11.21

WORKDIR /opt/gusztavvargadr/chef

ENV CHEF_LICENSE accept-silent

ENTRYPOINT [ "chef" ]
CMD [ "--version" ]
