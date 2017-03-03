property :instance_name, String, name_property: true
property :version, String, default: node['gusztavvargadr_octopus']['tentacle']['version']
property :home_directory_path, String, default: node['gusztavvargadr_octopus']['tentacle']['home_directory_path']
property :communication_port, Integer, default: node['gusztavvargadr_octopus']['tentacle']['communication_port']
property :server_web_address, String, default: node['gusztavvargadr_octopus']['tentacle']['server_web_address']
property :server_web_username, String, default: node['gusztavvargadr_octopus']['tentacle']['server_web_username']
property :server_web_password, String, default: node['gusztavvargadr_octopus']['tentacle']['server_web_password']
property :server_communication_port, Integer, default: node['gusztavvargadr_octopus']['tentacle']['server_communication_port']
property :node_name, String, default: node['gusztavvargadr_octopus']['tentacle']['node_name']
property :environment_names, Array, default: node['gusztavvargadr_octopus']['tentacle']['environment_names']
property :tenant_names, Array, default: node['gusztavvargadr_octopus']['tentacle']['tenant_names']
property :role_names, Array, default: node['gusztavvargadr_octopus']['tentacle']['role_names']

action :install do
  if version.to_s.empty?
    chocolatey_package 'octopusdeploy.tentacle' do
      action :install
    end
  else
    chocolatey_package 'octopusdeploy.tentacle' do
      version new_resource.version
      action :install
    end
  end
end

action :configure do
  unless server_web_username.to_s.empty?
    instance_name = 'Tentacle' if instance_name.to_s.empty?

    executable_path = 'C:\\Program Files\\Octopus Deploy\\Tentacle\\Tentacle.exe'
    environments = environment_names.map { |environment_name| "--environment=\"#{environment_name}\"" }.join(' ')
    tenants = tenant_names.map { |tenant_name| "--tenant=\"#{tenant_name}\"" }.join(' ')
    roles = role_names.map { |role_name| "--role=\"#{role_name}\"" }.join(' ')
    gusztavvargadr_windows_powershell_script_elevated "Create Octopus Tentacle instance #{instance_name}" do
      code <<-EOH
        & "#{executable_path}" create-instance --instance "#{instance_name}" --config "#{home_directory_path}\\#{instance_name}.config" --console
        & "#{executable_path}" new-certificate --instance "#{instance_name}" --if-blank --console
        & "#{executable_path}" configure --instance "#{instance_name}" --reset-trust --console
        & "#{executable_path}" configure --instance "#{instance_name}" --home "#{home_directory_path}" --app "#{home_directory_path}\\Applications" --port "#{communication_port}" --noListen "True" --console
        & "#{executable_path}" service --instance "#{instance_name}" --stop --console
        & "#{executable_path}" polling-proxy --instance "#{instance_name}" --proxyEnable "False" --proxyUsername "" --proxyPassword "" --proxyHost "" --proxyPort ""  --console
        & "#{executable_path}" service --instance "#{instance_name}" --start  --console
        & "#{executable_path}" register-with --instance "#{instance_name}" --server "#{server_web_address}" --name "#{node_name}" --comms-style "TentacleActive" --server-comms-port "#{server_communication_port}" --username "#{server_web_username}" --password "#{server_web_password}" --force #{environments} #{tenants} #{roles} --console
        & "#{executable_path}" service --instance "#{instance_name}" --install --start --console
      EOH
      action :run
      not_if { ::File.exist?("#{home_directory_path}\\#{instance_name}.config") }
    end

    powershell_script "Enable Octopus Tentacle instance #{instance_name} communication port #{communication_port}" do
      code <<-EOH
        netsh advfirewall firewall add rule "name=Octopus Tentacle #{instance_name} Communication #{communication_port}" dir=in action=allow protocol=TCP localport=#{communication_port}
      EOH
      action :run
    end
  end
end
