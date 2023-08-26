tools = node['gusztavvargadr_dotnet']['tools']
tools.each do |tool_name, tool_options|
  gusztavvargadr_dotnet_tool tool_name do
    options tool_options
    action :initialize
  end
end
