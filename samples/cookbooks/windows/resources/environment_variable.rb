property :environment_variable_name, String, name_property: true
property :environment_variable_options, Hash, required: true

default_action :create

action :create do
  environment_variable_value = new_resource.environment_variable_options['value']
  environment_variable_type = new_resource.environment_variable_options['type'] || 'User'

  powershell_script "Update environment variable '#{new_resource.environment_variable_name}'" do
    code <<-EOH
      [Environment]::SetEnvironmentVariable("#{new_resource.environment_variable_name}", "#{environment_variable_value}", "#{environment_variable_type}")
    EOH
    action :run
  end
end
