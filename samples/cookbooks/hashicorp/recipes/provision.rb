tools = node['gusztavvargadr_hashicorp']['tools']
tools.each do |tool_name, tool_options|
  gusztavvargadr_hashicorp_tool tool_name do
    options tool_options
    action :install
    not_if { reboot_pending? }
  end
end
