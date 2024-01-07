reboot 'gusztavvargadr_vagrant::cleanup' do
  action :reboot_now
  only_if { reboot_pending? }
end
