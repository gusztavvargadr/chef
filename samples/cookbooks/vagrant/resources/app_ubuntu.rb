provides :gusztavvargadr_vagrant_app, platform: 'ubuntu'

property :version, String, default: ''

default_action :install

action :install do
  return if new_resource.version.to_s.empty?

  dpkg_download_uri = "https://releases.hashicorp.com/vagrant/#{new_resource.version}/vagrant_#{new_resource.version}_x86_64.deb"
  dpkg_local_path = "#{Chef::Config['file_cache_path']}/vagrant_#{new_resource.version}_x86_64.deb"

  remote_file dpkg_local_path do
    source dpkg_download_uri
    action :create
  end

  dpkg_package dpkg_local_path do
    source dpkg_local_path
    action :install
  end
end
