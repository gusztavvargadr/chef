property :engine_edition, String, name_property: true

default_action :install

action :prepare do
  engine_options = node['gusztavvargadr_docker']["engine_#{new_resource.engine_edition}"]

  gusztavvargadr_windows_features '' do
    features_options engine_options['features']
  end

  engine_options['powershell_modules'].each do |module_name, module_options|
    powershell_script "Install PowerShell module '#{module_name}'" do
      code <<-EOH
        Install-Module #{module_name} -Force
      EOH
      action :run
    end
  end
end

action :install do
  engine_options = node['gusztavvargadr_docker']["engine_#{new_resource.engine_edition}"]

  gusztavvargadr_windows_chocolatey_packages '' do
    chocolatey_packages_options engine_options['chocolatey_packages']
  end

  engine_options['powershell_packages'].each do |package_name, package_options|
    powershell_script "Install PowerShell package '#{package_name}'" do
      code <<-EOH
        Install-Package #{package_name} -ProviderName #{package_options['provider']} -Force
      EOH
      action :run
    end
  end
end
