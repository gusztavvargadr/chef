tools = node['gusztavvargadr_ubuntu']['tools']
tools.each do |tool_name, tool_options|
  gusztavvargadr_ubuntu_tool tool_name do
    options tool_options
    action :configure
  end
end
