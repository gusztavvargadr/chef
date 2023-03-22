gusztavvargadr_docker_engine '' do
  edition node['gusztavvargadr_docker']['engine']['edition']
  action :prepare
end

gusztavvargadr_docker_engine '' do
  edition node['gusztavvargadr_docker']['engine']['edition']
  action :install
  not_if { reboot_pending? }
end
