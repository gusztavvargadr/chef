unified_mode true

provides :gusztavvargadr_vagrant_tool

property :options, Hash, default: {}

default_action :install

action :initialize do
  options = node['gusztavvargadr_vagrant']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  gusztavvargadr_hashicorp_tool options['tool'] do
    action :initialize
  end
end

action :install do
  options = node['gusztavvargadr_vagrant']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  gusztavvargadr_hashicorp_tool options['tool'] do
    action :install
  end
end

action :configure do
  options = node['gusztavvargadr_vagrant']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  gusztavvargadr_hashicorp_tool options['tool'] do
    action :configure
  end
end
