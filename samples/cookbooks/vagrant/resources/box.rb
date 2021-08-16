unified_mode true

property :options, Hash, default: {}

default_action :add

action :add do
  box_list = shell_out('vagrant box list').stdout
  return if box_list.downcase.include?(new_resource.name.downcase)

  box_provider = new_resource.options['provider']

  execute "Add Vagrant box '#{new_resource.name}'" do
    command "vagrant box add #{new_resource.name} --provider #{box_provider}"
    action :run
  end
end
