unified_mode true

provides :gusztavvargadr_dotnet_tool, platform: 'ubuntu'

property :options, Hash, default: {}

default_action :install

action :initialize do
  options = node['gusztavvargadr_dotnet']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  apt_repository 'dotnet-backports' do
    uri 'ppa:dotnet/backports'
    key 'https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x45a3f127159be9e5017811c62125b164e8e5d3fa'
    trusted true
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
