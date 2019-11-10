FROM chef/chefworkstation:0.11.21

ENTRYPOINT [ "chef" ]
CMD [ "--version" ]
