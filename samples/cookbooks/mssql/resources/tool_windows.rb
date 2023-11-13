unified_mode true

provides :gusztavvargadr_mssql_tool, platform: 'windows'

property :options, Hash, default: {}

default_action :install

action :install do
  options = node['gusztavvargadr_mssql']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  download_file_source = options['install_file_url']
  unless download_file_source.nil?
    directory_path = "#{Chef::Config['file_cache_path']}/gusztavvargadr_mssql_tool"

    directory directory_path do
      recursive true
      action :create
    end

    configuration_file_name = options['configuration_file_name']
    configuration_file_path = "#{directory_path}/#{configuration_file_name}"
    cookbook_file configuration_file_path do
      source configuration_file_name
      cookbook 'gusztavvargadr_mssql'
      action :create
    end

    download_file_name = 'install.iso'
    download_file_path = "#{directory_path}/#{download_file_name}"
    remote_file download_file_path do
      source download_file_source
      action :create
    end

    extract_directory_path = "#{directory_path}/install"
    archive_file download_file_path do
      destination extract_directory_path
      action :extract
    end

    powershell_script "Execute SQL Server Install for #{new_resource.name}" do
      code <<~EOH
        Start-Process "setup.exe" "/CONFIGURATIONFILE=#{configuration_file_path.tr('/', '\\')} /IACCEPTSQLSERVERLICENSETERMS" -Wait
      EOH
      cwd extract_directory_path
      action :run
    end

    service_list = powershell_out('Get-Service | Where { $_.Name -eq "mpssvc" } | Where { $_.Status -eq "Running" }').stdout
    return if service_list.strip.empty?

    powershell_script 'Enable Firewall' do
      code <<~EOH
        netsh advfirewall firewall add rule name="SQL Server" dir=in localport=1433 protocol=TCP action=allow
      EOH
      action :run
    end
  end

  download_file_source = options['patch_file_url']
  unless download_file_source.nil?
    directory_path = "#{Chef::Config['file_cache_path']}/gusztavvargadr_mssql_tool"

    directory directory_path do
      recursive true
      action :create
    end

    download_file_name = 'patch.exe'
    download_file_path = "#{directory_path}/#{download_file_name}"
    remote_file download_file_path do
      source download_file_source
      action :create
    end

    extract_directory_path = "#{directory_path}/patch"
    directory extract_directory_path do
      recursive true
      action [:delete, :create]
    end

    powershell_script "Extract SQL Server Patch for #{new_resource.name}" do
      code <<~EOH
        Start-Process "#{download_file_path.tr('/', '\\')}" "/x:./ /q" -Wait
      EOH
      cwd extract_directory_path
      action :run
    end

    powershell_script "Execute SQL Server Patch for #{new_resource.name}" do
      code <<~EOH
        Start-Process "setup.exe" "/ACTION=PATCH /ALLINSTANCES /IACCEPTSQLSERVERLICENSETERMS /QUIET" -Wait
      EOH
      cwd extract_directory_path
      action :run
    end
  end

  native_packages = options['native_packages']
  unless native_packages.nil?
    native_packages.each do |native_package_name, native_package_options|
      gusztavvargadr_windows_native_package native_package_name do
        options native_package_options
        action :install
      end
    end
  end
end
