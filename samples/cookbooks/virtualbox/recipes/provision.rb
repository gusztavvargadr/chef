tools = node['gusztavvargadr_virtualbox']['tools']
tools.each do |tool_name, tool_options|
  gusztavvargadr_virtualbox_tool tool_name do
    options tool_options
    action :install
  end
end
