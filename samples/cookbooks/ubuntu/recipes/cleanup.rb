reboot 'gusztavvargadr_ubuntu::cleanup' do
  delay_mins 1
  action :reboot_now
  only_if { reboot_pending? }
end

updates = node['gusztavvargadr_ubuntu']['updates']
updates.each do |update_name, update_options|
  gusztavvargadr_ubuntu_update update_name do
    options update_options
    action :cleanup
  end
end
