unified_mode true

provides :gusztavvargadr_dotnet_tool, platform: 'ubuntu'

property :options, Hash, default: {}

default_action :install

action :initialize do
  _ = node['gusztavvargadr_dotnet']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  file '/etc/apt/preferences.d/microsoft' do
    content <<~EOH
      Package:*
      Pin: origin "packages.microsoft.com"
      Pin-Priority: 1001
    EOH
    action :create
  end

  release_version = shell_out('lsb_release -rs').stdout.strip

  apt_repository 'microsoft-prod' do
    uri "https://packages.microsoft.com/ubuntu/#{release_version}/prod"
    key 'https://packages.microsoft.com/keys/microsoft.asc'
    components ['main']
    action :add
  end
end

action :install do
  options = node['gusztavvargadr_dotnet']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  apt_package options['package'] do
    action :install
  end
end
