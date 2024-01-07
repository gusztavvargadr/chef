tools = node['gusztavvargadr_mssql']['tools']
tools.each do |tool_name, tool_options|
  gusztavvargadr_mssql_tool tool_name do
    options tool_options
    action :install
  end
end
