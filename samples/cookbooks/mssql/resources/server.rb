property :version, String, default: ''
property :edition, String, default: ''

action :install do
  return if new_resource.version.to_s.empty?
  return if new_resource.edition.to_s.empty?

  directory_path = "#{Chef::Config['file_cache_path']}/gusztavvargadr_mssql/server_#{new_resource.version}_#{new_resource.edition}"

  directory directory_path do
    recursive true
    action :create
  end

  configuration_file_name = 'install.ini'
  configuration_file_path = "#{directory_path}/#{configuration_file_name}"
  configuration_file_source = "server_#{new_resource.version}_#{new_resource.edition}.ini"
  cookbook_file configuration_file_path do
    source configuration_file_source
    cookbook 'gusztavvargadr_mssql'
    action :create
  end

  download_file_name = 'install.iso'
  download_file_path = "#{directory_path}/#{download_file_name}"
  download_file_source = node['gusztavvargadr_mssql']['server']["#{new_resource.version}_#{new_resource.edition}"]['install_file_url']
  remote_file download_file_path do
    source download_file_source
    action :create
  end

  extract_directory_path = "#{directory_path}/install"
  directory extract_directory_path do
    recursive true
    action [:delete, :create]
  end

  powershell_script "Extract SQL Server #{new_resource.version} #{new_resource.edition} Install" do
    code <<-EOH
      7z x #{download_file_path.tr('/', '\\')}
    EOH
    cwd extract_directory_path
    action :run
  end

  gusztavvargadr_windows_powershell_script_elevated "Execute SQL Server #{new_resource.version} #{new_resource.edition} Install" do
    code <<-EOH
      Start-Process "setup.exe" "/CONFIGURATIONFILE=#{configuration_file_path.tr('/', '\\')} /IACCEPTSQLSERVERLICENSETERMS" -Wait
    EOH
    cwd extract_directory_path
    action :run
  end

  service_list = powershell_out('Get-Service | Where { $_.Name -eq "mpssvc" } | Where { $_.Status -eq "Running" }').stdout
  return if service_list.strip.empty?

  powershell_script 'Enable Firewall' do
    code <<-EOH
     netsh advfirewall firewall add rule name="SQL Server" dir=in localport=1433 protocol=TCP action=allow
    EOH
    action :run
  end
end

action :patch do
  return if new_resource.version.to_s.empty?
  return if new_resource.edition.to_s.empty?

  directory_path = "#{Chef::Config['file_cache_path']}/gusztavvargadr_mssql/server_#{new_resource.version}_#{new_resource.edition}"

  directory directory_path do
    recursive true
    action :create
  end

  download_file_name = 'patch.exe'
  download_file_path = "#{directory_path}/#{download_file_name}"
  download_file_source = node['gusztavvargadr_mssql']['server']["#{new_resource.version}_#{new_resource.edition}"]['patch_file_url']
  remote_file download_file_path do
    source download_file_source
    action :create
  end

  extract_directory_path = "#{directory_path}/patch"
  directory extract_directory_path do
    recursive true
    action [:delete, :create]
  end

  powershell_script "Extract SQL Server #{new_resource.version} #{new_resource.edition} Patch" do
    code <<-EOH
      Start-Process "#{download_file_path.tr('/', '\\')}" "/x:./ /q" -Wait
    EOH
    cwd extract_directory_path
    action :run
  end

  gusztavvargadr_windows_powershell_script_elevated "Execute SQL Server #{new_resource.version} #{new_resource.edition} Patch" do
    code <<-EOH
      Start-Process "setup.exe" "/ACTION=PATCH /ALLINSTANCES /IACCEPTSQLSERVERLICENSETERMS /QUIET" -Wait
    EOH
    cwd extract_directory_path
    action :run
  end
end
