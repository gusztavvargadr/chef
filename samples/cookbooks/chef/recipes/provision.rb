tools = node['gusztavvargadr_chef']['tools']
tools.each do |tool_name, tool_options|
  gusztavvargadr_chef_tool tool_name do
    options tool_options
    action :install
    not_if { reboot_pending? }
  end
end
