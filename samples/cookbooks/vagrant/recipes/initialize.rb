tools = node['gusztavvargadr_vagrant']['tools']
tools.each do |tool_name, tool_options|
  gusztavvargadr_vagrant_tool tool_name do
    options tool_options
    action :initialize
  end
end
