property :edition, String, name_property: true

default_action :install

action :prepare do
  options = node['gusztavvargadr_docker']["engine_#{new_resource.edition}"]

  gusztavvargadr_windows_features '' do
    options options['features']
  end

  options['powershell_modules'].each do |module_name, module_options|
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

  gusztavvargadr_windows_native_packages '' do
    options options['native_packages']
  end

  options['powershell_packages'].each do |package_name, package_options|
    powershell_script "Install PowerShell package '#{package_name}'" do
      code <<-EOH
        Install-Package #{package_name} -ProviderName #{package_options['provider']} -Force
      EOH
      action :run
    end
  end
end
