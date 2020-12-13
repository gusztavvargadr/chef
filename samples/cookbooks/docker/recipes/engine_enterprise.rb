gusztavvargadr_docker_engine 'enterprise' do
  action :prepare
end

gusztavvargadr_docker_engine 'enterprise' do
  action :install
  not_if { reboot_pending? }
end
