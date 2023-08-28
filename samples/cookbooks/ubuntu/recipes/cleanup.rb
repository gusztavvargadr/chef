reboot 'gusztavvargadr_ubuntu::cleanup' do
  action :request_reboot
  only_if { reboot_pending? }
end
