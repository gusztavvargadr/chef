gusztavvargadr_docker_engine node['gusztavvargadr_docker']['engine']['edition'] do
  engine_mode node['gusztavvargadr_docker']['engine']['mode']
  action [:prepare, :install, :switch]
end
