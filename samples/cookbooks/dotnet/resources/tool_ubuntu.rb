unified_mode true

provides :gusztavvargadr_dotnet_tool, platform: 'ubuntu'

property :options, Hash, default: {}

default_action :install

action :initialize do
  _ = node['gusztavvargadr_dotnet']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  os_version = node['platform_version']

  apt_repository 'dotnet-backports' do
    uri 'ppa:dotnet/backports'
    key 'https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x45a3f127159be9e5017811c62125b164e8e5d3fa'
    action :add
  end

  apt_preference 'dotnet-backports' do
    glob '*'
    pin 'release o=LP-PPA-dotnet-backports'
    pin_priority '1000'
    action :add
  end

  return unless os_version.equal?('22.04')

  deb_source = "https://packages.microsoft.com/config/ubuntu/#{os_version}/packages-microsoft-prod.deb"
  deb_target = "#{Chef::Config[:file_cache_path]}/packages-microsoft-prod.deb"

  remote_file deb_target do
    source deb_source
    action :create
  end

  dpkg_package 'packages-microsoft-prod' do
    source deb_target
    action :install
  end

  file deb_target do
    action :delete
  end

  apt_update do
    action :update
  end

  apt_preference 'microsoft' do
    glob '*'
    pin 'origin packages.microsoft.com'
    pin_priority '1001'
    action :add
  end
end

action :install do
  options = node['gusztavvargadr_dotnet']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  apt_package options['package'] do
    action :install
  end
end
