tools = node['gusztavvargadr_vagrant']['tools']
tools.each do |tool_name, tool_options|
  gusztavvargadr_vagrant_tool tool_name do
    options tool_options
    action :configure
  end
end

plugins = node['gusztavvargadr_vagrant']['plugins']
plugins.each do |plugin_name, plugin_options|
  gusztavvargadr_vagrant_plugin plugin_name do
    options plugin_options
    action :install
  end
end

boxes = node['gusztavvargadr_vagrant']['boxes']
boxes.each do |box_name, box_options|
  gusztavvargadr_vagrant_box box_name do
    options box_options
    action :add
  end
end
