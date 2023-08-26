unified_mode true

provides :gusztavvargadr_dotnet_tool, platform: 'ubuntu'

property :options, Hash, default: {}

default_action :install

action :initialize do
  _ = node['gusztavvargadr_dotnet']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  release_name = node['lsb']['release']
  dotnet_packages_download_uri = "https://packages.microsoft.com/config/ubuntu/#{release_name}/packages-microsoft-prod.deb"
  dotnet_packages_local_path = "#{Chef::Config['file_cache_path']}/packages-microsoft-prod.deb"

  remote_file dotnet_packages_local_path do
    source dotnet_packages_download_uri
    action :create
  end

  dpkg_package 'dotnet-packages' do
    source dotnet_packages_local_path
    action :nothing
    subscribes :install, "remote_file[#{dotnet_packages_local_path}]", :immediately
  end

  apt_update 'dotnet-repository' do
    action :nothing
    subscribes :update, 'dpkg_package[dotnet-packages]', :immediately
  end
end

action :install do
  options = node['gusztavvargadr_dotnet']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  apt_package options['package'] do
    action :install
  end
end
