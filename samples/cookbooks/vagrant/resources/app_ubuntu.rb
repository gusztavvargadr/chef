unified_mode true

provides :gusztavvargadr_vagrant_app, platform: 'ubuntu'

property :version, String, default: ''

default_action :install

action :install do
  return if new_resource.version.to_s.empty?

  apt_package 'apt-transport-https' do
    action :install
  end

  apt_repository 'hashicorp' do
    arch 'amd64'
    uri 'https://apt.releases.hashicorp.com'
    key 'https://apt.releases.hashicorp.com/gpg'
    components ['main']
    action :add
  end

  apt_package 'vagrant' do
    version new_resource.version unless new_resource.version == 'latest'
    action :install
  end
end
