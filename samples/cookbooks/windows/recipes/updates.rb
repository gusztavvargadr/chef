gusztavvargadr_windows_updates '' do
  action node['gusztavvargadr_windows']['updates']['actions']
  not_if { reboot_pending? }
end

reboot 'gusztavvargadr_windows::updates' do
  action :request_reboot
  only_if { reboot_pending? }
end
