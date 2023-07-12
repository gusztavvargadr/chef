engine_options = node['gusztavvargadr_docker']['engine']

gusztavvargadr_docker_engine '' do
  edition engine_options['edition']
  action :prepare
end

gusztavvargadr_docker_engine '' do
  edition engine_options['edition']
  action :install
  not_if { reboot_pending? }
end
