property :instance_name, String, name_property: true
property :version, String, default: node['gusztavvargadr_octopus']['server']['version']
property :home_directory_path, String, default: node['gusztavvargadr_octopus']['server']['home_directory_path']
property :service_username, String, default: node['gusztavvargadr_octopus']['server']['service_username']
property :storage_connection_string, String, default: node['gusztavvargadr_octopus']['server']['storage_connection_string']
property :web_address, String, default: node['gusztavvargadr_octopus']['server']['web_address']
property :web_username, String, default: node['gusztavvargadr_octopus']['server']['web_username']
property :web_password, String, default: node['gusztavvargadr_octopus']['server']['web_password']
property :communication_port, Integer, default: node['gusztavvargadr_octopus']['server']['communication_port']
property :node_name, String, default: node['gusztavvargadr_octopus']['server']['node_name']
property :license, String, default: node['gusztavvargadr_octopus']['server']['license']
property :import, String, default: node['gusztavvargadr_octopus']['server']['import']

action :install do
  if version.to_s.empty?
    chocolatey_package 'octopusdeploy' do
      action :install
    end
  else
    chocolatey_package 'octopusdeploy' do
      version new_resource.version
      action :install
    end
  end
end

action :configure do
  unless web_username.to_s.empty?
    instance_name = 'Server' if instance_name.to_s.empty?

    executable_file_path = 'C:\\Program Files\\Octopus Deploy\\Octopus\\Octopus.Server.exe'
    gusztavvargadr_windows_powershell_script_elevated "Create Octopus Server instance #{instance_name}" do
      code <<-EOH
        & "#{executable_file_path}" create-instance --instance "#{instance_name}" --config "#{home_directory_path}\\#{instance_name}.config" --console
        & "#{executable_file_path}" configure --instance "#{instance_name}" --home "#{home_directory_path}" --storageConnectionString "#{storage_connection_string}" --upgradeCheck "False" --upgradeCheckWithStatistics "False" --webAuthenticationMode "UsernamePassword" --webForceSSL "False" --webListenPrefixes "#{web_address}" --commsListenPort "#{communication_port}" --serverNodeName "#{node_name}" --console
        & "#{executable_file_path}" database --instance "#{instance_name}" --create --grant "#{service_username}" --console
        & "#{executable_file_path}" service --instance "#{instance_name}" --stop --console
        & "#{executable_file_path}" admin --instance "#{instance_name}" --username "#{web_username}" --password "#{web_password}" --console
        #{
          unless license.to_s.empty?
            "& \"#{executable_file_path}\" license --instance \"#{instance_name}\" --licenseBase64 \"#{license}\" --console"
          end
        }
        & "#{executable_file_path}" service --instance "#{instance_name}" --install --reconfigure --start --console
      EOH
      # after amdmin & "#{executable_file_path}" license --instance "OctopusServer" --licenseBase64 "" --console
      action :run
      not_if { ::File.exist?("#{home_directory_path}\\#{instance_name}.config") }
    end

    web_port = URI(web_address).port
    powershell_script "Enable Octopus Server instance #{instance_name} web port #{web_port}" do
      code <<-EOH
        netsh advfirewall firewall add rule "name=Octopus Server #{instance_name} Web #{web_port}" dir=in action=allow protocol=TCP localport=#{web_port}
      EOH
      action :run
    end

    powershell_script "Enable Octopus Server instance #{instance_name} communication port #{communication_port}" do
      code <<-EOH
        netsh advfirewall firewall add rule "name=Octopus Server #{instance_name} Communication #{communication_port}" dir=in action=allow protocol=TCP localport=#{communication_port}
      EOH
      action :run
    end
  end
end

action :import do
  instance_name = 'Server' if instance_name.to_s.empty?

  import.each do |import_directory_path, import_password|
    unless import_directory_path.to_s.empty?

      executable_directory_path = 'C:\\Program Files\\Octopus Deploy\\Octopus'
      powershell_script "Import from #{import_directory_path}" do
        code <<-EOH
          & "#{executable_directory_path}\\Octopus.Migrator.exe" import --instance "#{instance_name}" --directory "#{import_directory_path}" --password "#{import_password}" --overwrite --console
          & "#{executable_directory_path}\\Octopus.Server.exe" service --instance "#{instance_name}" --stop --start --console
        EOH
        action :run
      end
    end
  end
end
