updates = node['gusztavvargadr_ubuntu']['updates']
updates.each do |update_name, update_options|
  gusztavvargadr_ubuntu_update update_name do
    options update_options
    action update_name.gsub('-', '_')
  end
end

tools = node['gusztavvargadr_ubuntu']['tools']
tools.each do |tool_name, tool_options|
  gusztavvargadr_ubuntu_tool tool_name do
    options tool_options
    action :install
  end
end

reboot 'gusztavvargadr_ubuntu::provision' do
  delay_mins 1
  action :reboot_now
  only_if { reboot_pending? }
end
