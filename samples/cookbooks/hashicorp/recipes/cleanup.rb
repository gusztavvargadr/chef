reboot 'gusztavvargadr_hashicorp::cleanup' do
  action :request_reboot
  only_if { reboot_pending? }
end
