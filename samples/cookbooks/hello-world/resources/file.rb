unified_mode true

provides :gusztavvargadr_hello_world_file

property :options, Hash, default: {}

default_action :create

action :initialize do
  _ = node['gusztavvargadr_hello_world']['options']['files'][new_resource.name][node['platform']].merge(new_resource.options)
end

action :create do
  options = node['gusztavvargadr_hello_world']['options']['files'][new_resource.name][node['platform']].merge(new_resource.options)

  file options['path'] do
    content options['content']
    action :create
  end
end
