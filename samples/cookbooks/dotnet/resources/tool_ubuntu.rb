unified_mode true

provides :gusztavvargadr_dotnet_tool, platform: 'ubuntu'

property :options, Hash, default: {}

default_action :install

action :initialize do
  _ = node['gusztavvargadr_dotnet']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  release_version = shell_out('lsb_release -rs').stdout.strip

  if release_version == '24.04'
    apt_repository 'dotnet-backports' do
      uri 'ppa:dotnet/backports'
      action :add
    end
  else
    apt_preference 'microsoft' do
      glob '*'
      pin 'origin packages.microsoft.com'
      pin_priority '1000'
      action :add
    end

    apt_repository 'microsoft-prod' do
      uri "https://packages.microsoft.com/ubuntu/#{release_version}/prod"
      key 'https://packages.microsoft.com/keys/microsoft.asc'
      components ['main']
      action :add
    end
  end
end

action :install do
  options = node['gusztavvargadr_dotnet']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  apt_package options['package'] do
    action :install
  end
end
