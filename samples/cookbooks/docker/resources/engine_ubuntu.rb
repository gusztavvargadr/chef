unified_mode true

provides :gusztavvargadr_docker_engine, platform: 'ubuntu'

property :version, String, default: ''
property :edition, String, default: ''

default_action :install

action :prepare do
  return unless new_resource.edition.to_s == 'community'

  apt_update 'update' do
    action :update
  end

  %w(ca-certificates curl gnupg lsb-release).each do |package_name|
    apt_package package_name do
      action :install
    end
  end
end

action :install do
  return unless new_resource.edition.to_s == 'community'

  options = node['gusztavvargadr_docker']['engine']["#{new_resource.edition}"]['ubuntu']

  apt_repository 'docker' do
    uri 'https://download.docker.com/linux/ubuntu'
    key 'https://download.docker.com/linux/ubuntu/gpg'
    components ['stable']
    action :add
  end

  docker_ce_version = "5:#{options['docker-ce']['version']}~3-0~ubuntu-#{shell_out('lsb_release -cs').stdout.strip}"
  apt_package 'docker-ce' do
    action :install
    version docker_ce_version
  end

  group 'docker' do
    append true
    members shell_out('echo ${SUDO_USER:-${USER}}').stdout.strip
    action :create
  end

  apt_package 'docker-compose-plugin' do
    action :install
  end
end
