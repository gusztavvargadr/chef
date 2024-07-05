reboot 'gusztavvargadr_vagrant::cleanup' do
  delay_mins 1
  action :reboot_now
  only_if { reboot_pending? }
end
