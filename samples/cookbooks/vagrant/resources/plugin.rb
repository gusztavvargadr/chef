property :options, Hash, default: {}

default_action :install

action :install do
  plugin_list = shell_out('vagrant plugin list').stdout
  return if plugin_list.downcase.include?(new_resource.name.downcase)

  execute "Install Vagrant plugin '#{new_resource.name}'" do
    command "vagrant plugin install #{new_resource.name}"
    action :run
  end
end
