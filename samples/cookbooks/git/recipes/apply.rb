tools = node['gusztavvargadr_git']['tools']
tools.each do |tool_name, tool_options|
  gusztavvargadr_git_tool tool_name do
    options tool_options
    action :upgrade
  end
end
