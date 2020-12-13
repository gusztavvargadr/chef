gusztavvargadr_docker_engine 'community' do
  action :prepare
end

gusztavvargadr_docker_engine 'community' do
  action :install
  not_if { reboot_pending? }
end
