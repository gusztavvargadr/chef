unified_mode true

provides :gusztavvargadr_vagrant_box

property :options, Hash, default: {}

default_action :add

action :add do
  options = new_resource.options

  box_name = new_resource.name
  box_provider = options['provider']
  return if box_name.to_s.empty? || box_provider.to_s.empty?

  box_list = shell_out('vagrant box list').stdout
  return if box_list.include?(box_name)

  execute "Add Vagrant box '#{box_name}'" do
    command "vagrant box add #{box_name} --provider #{box_provider}"
    action :run
  end
end
