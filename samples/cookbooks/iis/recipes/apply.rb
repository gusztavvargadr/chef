tools = node['gusztavvargadr_iis']['tools']
tools.each do |tool_name, tool_options|
  gusztavvargadr_iis_tool tool_name do
    options tool_options
    action :install
  end
end
