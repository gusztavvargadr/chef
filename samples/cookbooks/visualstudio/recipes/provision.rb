tools = node['gusztavvargadr_visualstudio']['tools']
tools.each do |tool_name, tool_options|
  gusztavvargadr_visualstudio_tool tool_name do
    options tool_options
    action :install
    not_if { reboot_pending? }
  end
end
