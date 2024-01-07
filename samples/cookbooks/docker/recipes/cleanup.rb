reboot 'gusztavvargadr_docker::cleanup' do
  action :reboot_now
  only_if { reboot_pending? }
end
