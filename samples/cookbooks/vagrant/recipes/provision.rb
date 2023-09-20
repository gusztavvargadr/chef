tools = node['gusztavvargadr_vagrant']['tools']
tools.each do |tool_name, tool_options|
  gusztavvargadr_vagrant_tool tool_name do
    options tool_options
    action :install
  end
end

reboot 'gusztavvargadr_vagrant::provision' do
  action :reboot_now
  only_if { reboot_pending? }
end
