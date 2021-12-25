unified_mode true

property :options, Hash, default: {}

default_action :install

action :install do
  chocolatey_package_list = powershell_out("choco list --local-only --exact #{new_resource.name}").stdout
  return if chocolatey_package_list.downcase.include?(new_resource.name.downcase)

  version = new_resource.options['version']
  install = new_resource.options['install'].nil? ? {} : new_resource.options['install']

  script_name = "Install Chocolatey package '#{new_resource.name}'"
  script_code = "choco install #{new_resource.name} --confirm --no-progress"
  script_code = "#{script_code} --version #{version}" unless version.to_s.empty?
  install.each do |install_name, install_value|
    script_code = "#{script_code} --#{install_name}"
    script_code = "#{script_code} #{install_value}" unless install_value.to_s.empty?
  end

  powershell_script script_name do
    code script_code
    action :run
  end
end
