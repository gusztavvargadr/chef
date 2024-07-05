reboot 'gusztavvargadr_windows::cleanup' do
  delay_mins 1
  action :reboot_now
  only_if { reboot_pending? }
end

updates = node['gusztavvargadr_windows']['updates']
updates.each do |update_name, update_options|
  gusztavvargadr_windows_update update_name do
    options update_options
    action :cleanup
  end
end
