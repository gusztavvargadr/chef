tools = node['gusztavvargadr_docker']['tools']
tools.each do |tool_name, tool_options|
  gusztavvargadr_docker_tool tool_name do
    options tool_options
    action :initialize
  end
end
