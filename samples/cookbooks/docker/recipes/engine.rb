gusztavvargadr_docker_engine '' do
  edition node['gusztavvargadr_docker']['engine']['edition']
  action [ :prepare, :install ]
end
