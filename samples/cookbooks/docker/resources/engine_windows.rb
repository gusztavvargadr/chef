unified_mode true

provides :gusztavvargadr_docker_engine, platform: 'windows'

property :version, String, default: ''
property :edition, String, default: ''

default_action :install

action :prepare do
  return if new_resource.edition.to_s.empty?

  options = node['gusztavvargadr_docker']['engine']["#{new_resource.edition}"]['windows']

  reboot 'docker-engine-prepare' do
    action :nothing
  end

  gusztavvargadr_windows_features '' do
    options options['features']
    action :install
    notifies :request_reboot, 'reboot[docker-engine-prepare]'
  end

  options['powershell_modules'].each do |module_name, _module_options|
    module_list = powershell_out("Get-Module -ListAvailable | Where { $_.Name -eq \"#{module_name}\" }").stdout
    next unless module_list.strip.empty?

    powershell_script "Install PowerShell module '#{module_name}'" do
      code <<-EOH
        Install-Module #{module_name} -Force
      EOH
      action :run
    end
  end

  options['powershell_packages'].each do |package_name, package_options|
    package_list = powershell_out("Get-Package -ProviderName #{package_options['provider']} | Where { $_.Name -eq \"#{package_name}\" }").stdout
    next unless package_list.strip.empty?

    powershell_script "Install PowerShell package '#{package_name}'" do
      code <<-EOH
        Install-Package #{package_name} -RequiredVersion #{package_options['version']} -ProviderName #{package_options['provider']} -Force
      EOH
      action :run
    end
  end
end

action :install do
  return if new_resource.edition.to_s.empty?

  options = node['gusztavvargadr_docker']['engine']["#{new_resource.edition}"]['windows']

  reboot 'docker-engine-install' do
    action :nothing
  end

  gusztavvargadr_windows_native_packages '' do
    options options['native_packages']
    action :install
    notifies :request_reboot, 'reboot[docker-engine-install]'
  end

  gusztavvargadr_windows_chocolatey_packages '' do
    options options['chocolatey_packages']
    action :install
  end
end
