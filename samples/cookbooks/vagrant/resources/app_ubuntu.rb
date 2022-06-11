unified_mode true

provides :gusztavvargadr_vagrant_app, platform: 'ubuntu'

property :options, Hash, default: {}

default_action :install

action :install do
  app_version = new_resource.options['version']
  return if app_version.to_s.empty?

  apt_update

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

  apt_update

  apt_package 'vagrant' do
    version app_version unless app_version == 'latest'
    action :install
  end
end
