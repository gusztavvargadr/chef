unified_mode true

provides :gusztavvargadr_dotnet_packages, platform: 'ubuntu'

default_action :install

action :install do
  dotnet_packages_download_uri = "https://packages.microsoft.com/config/ubuntu/#{shell_out('lsb_release -rs').stdout.strip}/packages-microsoft-prod.deb"
  dotnet_packages_local_path = "#{Chef::Config['file_cache_path']}/packages-microsoft-prod.deb"

  remote_file dotnet_packages_local_path do
    source dotnet_packages_download_uri
    action :create
  end

  dpkg_package 'dotnet-packages' do
    source dotnet_packages_local_path
    action :install
  end

  apt_update '' do
    action :update
  end
end
