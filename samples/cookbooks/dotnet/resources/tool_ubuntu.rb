unified_mode true

provides :gusztavvargadr_dotnet_tool, platform: 'ubuntu'

property :options, Hash, default: {}

default_action :install

action :initialize do
  options = node['gusztavvargadr_dotnet']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  return if options['package'].include?('10.0')

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

  if options['package'].include?('10.0')
    bash 'dotnet_install' do
      code <<~EOH
        curl -L https://dot.net/v1/dotnet-install.sh | sudo bash -s -- --channel 10.0
      EOH
      action :run
    end
  else
    apt_package options['package'] do
      action :install
    end
  end
end
