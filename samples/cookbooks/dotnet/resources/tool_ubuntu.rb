unified_mode true

provides :gusztavvargadr_dotnet_tool, platform: 'ubuntu'

property :options, Hash, default: {}

default_action :install

action :initialize do
  _ = node['gusztavvargadr_dotnet']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  apt_repository 'dotnet-backports' do
    uri 'ppa:dotnet/backports'
    action :add
  end

  apt_preference 'dotnet-backports' do
    glob '*'
    pin 'release o=LP-PPA-dotnet-backports'
    pin_priority '1000'
    action :add
  end
end

action :install do
  options = node['gusztavvargadr_dotnet']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  apt_package options['package'] do
    action :install
  end
end
