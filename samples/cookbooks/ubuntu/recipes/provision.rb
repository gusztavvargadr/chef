updates = node['gusztavvargadr_ubuntu']['updates']
updates.each do |update_name, update_options|
  gusztavvargadr_ubuntu_update update_name do
    options update_options
    action update_name.gsub('-', '_')
  end
end

reboot 'gusztavvargadr_ubuntu::provision' do
  action :reboot_now
  only_if { reboot_pending? }
end
