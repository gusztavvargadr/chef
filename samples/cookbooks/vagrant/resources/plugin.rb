unified_mode true

provides :gusztavvargadr_vagrant_plugin

property :options, Hash, default: {}

default_action :install

action :install do
  plugin_name = new_resource.name
  return if plugin_name.to_s.empty?

  plugin_list = shell_out('vagrant plugin list').stdout
  return if plugin_list.include?(plugin_name)

  execute "Install Vagrant plugin '#{plugin_name}'" do
    command "vagrant plugin install #{plugin_name}"
    action :run
  end
end
