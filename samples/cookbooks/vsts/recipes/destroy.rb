tools = node['gusztavvargadr_vsts']['tools']
tools.each do |tool_name, tool_options|
  gusztavvargadr_vsts_tool tool_name do
    options tool_options
    action :remove
  end
end
