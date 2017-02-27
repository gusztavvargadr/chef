tentacle = node['gusztavvargadr_octopus']['tentacle']

server_web_address = tentacle['server_web_address']
api_key = tentacle['api_key']
environment_name = tentacle['environment_name']

chocolatey_package 'octopustools' do
  action :install
end

unless api_key.to_s.empty?
  gusztavvargadr_octopus_environment environment_name do
    server_web_address server_web_address
    api_key api_key
    action :create
  end
end

gusztavvargadr_octopus_tentacle tentacle['instance_name'] do
  version tentacle['version']
  home_directory_path tentacle['home_directory_path']
  communication_port tentacle['communication_port']
  server_web_address server_web_address
  server_communication_port tentacle['server_communication_port']
  api_key api_key
  node_name tentacle['node_name'].to_s == '' ? node['hostname'] : tentacle['node_name']
  environment_name environment_name
  role_names tentacle['role_names']
  action [:install, :configure]
end

unless api_key.to_s.empty?
  project_file_paths = tentacle['project_file_paths']
  unless project_file_paths.nil?
    project_file_paths.each do |project_file_path|
      gusztavvargadr_octopus_project project_file_path do
        server_web_address server_web_address
        api_key api_key
        action :import
      end
    end
  end
end