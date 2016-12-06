server = node['gusztavvargadr_octopus']['server']

gusztavvargadr_octopus_server server['instance_name'] do
  version server['version']
  home_directory_path server['home_directory_path']
  service_username server['service_username']
  storage_server_name server['storage_server_name']
  storage_database_name server['storage_database_name']
  web_address server['web_address']
  web_username server['web_username']
  web_password server['web_password']
  communication_port server['communication_port']
  node_name server['node_name'].to_s == '' ? node['hostname'] : server['node_name']
  action [:install, :configure]
end

import_directory_path = server['import_directory_path']
import_password = server['import_password']

unless import_directory_path.to_s == '' || import_password.to_s == ''
  executable_directory_path = 'C:\\Program Files\\Octopus Deploy\\Octopus'
  powershell_script "Import from #{import_directory_path}" do
    code <<-EOH
      & "#{executable_directory_path}\\Octopus.Migrator.exe" import --instance "#{server['instance_name']}" --directory "#{import_directory_path.tr('/', '\\')}" --password "#{import_password}" --overwrite --console
      & "#{executable_directory_path}\\Octopus.Server.exe" service --instance "#{server['instance_name']}" --stop --start --console
    EOH
    action :run
  end
end
