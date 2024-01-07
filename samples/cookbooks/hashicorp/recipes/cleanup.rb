reboot 'gusztavvargadr_hashicorp::cleanup' do
  action :reboot_now
  only_if { reboot_pending? }
end
