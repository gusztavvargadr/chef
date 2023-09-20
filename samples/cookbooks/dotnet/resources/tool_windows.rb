unified_mode true

provides :gusztavvargadr_dotnet_tool, platform: 'windows'

property :options, Hash, default: {}

default_action :install

action :initialize do
  _ = node['gusztavvargadr_dotnet']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)
end

action :install do
  options = node['gusztavvargadr_dotnet']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  chocolatey_package options['package'] do
    action :install
  end
end
