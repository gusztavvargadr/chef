property :edition, String, name_property: true

default_action :install

action :prepare do
  options = node['gusztavvargadr_docker']["engine_#{new_resource.edition}"]

  gusztavvargadr_windows_features '' do
    options options['features']
    action :install
  end

  options['powershell_modules'].each do |module_name, module_options|
    module_list = powershell_out("Get-Module -ListAvailable | Where { $_.Name -eq \"#{module_name}\" }").stdout
    next unless module_list.strip.empty?

    powershell_script "Install PowerShell module '#{module_name}'" do
      code <<-EOH
        Install-Module #{module_name} -Force
      EOH
      action :run
    end
  end
end

action :install do
  options = node['gusztavvargadr_docker']["engine_#{new_resource.edition}"]

  options['powershell_packages'].each do |package_name, package_options|
    package_list = powershell_out("Get-Package -ProviderName #{package_options['provider']} | Where { $_.Name -eq \"#{package_name}\" }").stdout
    next unless package_list.strip.empty?

    powershell_script "Install PowerShell package '#{package_name}'" do
      code <<-EOH
        Install-Package #{package_name} -ProviderName #{package_options['provider']} -Force
      EOH
      action :run
    end
  end

  gusztavvargadr_windows_chocolatey_packages '' do
    options options['chocolatey_packages']
    action :install
  end
end
