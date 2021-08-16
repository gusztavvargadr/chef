unified_mode true

property :options, Hash, default: {}

default_action :create

action :create do
  value = new_resource.options['value']
  type = new_resource.options['type'] || 'User'

  powershell_script "Update environment variable '#{new_resource.name}'" do
    code <<-EOH
      [Environment]::SetEnvironmentVariable("#{new_resource.name}", "#{value}", "#{type}")
    EOH
    action :run
  end
end
