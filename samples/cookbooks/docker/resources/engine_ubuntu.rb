provides :gusztavvargadr_docker_engine, platform: 'ubuntu'

property :version, String, default: ''
property :edition, String, default: ''

default_action :install

action :prepare do
  return if new_resource.version.to_s.empty?
  return unless new_resource.edition.to_s == 'community'

  %w(apt-transport-https ca-certificates curl gnupg lsb-release).each do |package_name|
    apt_package package_name do
      action :install
    end
  end
end

action :install do
  return if new_resource.version.to_s.empty?
  return unless new_resource.edition.to_s == 'community'

  apt_repository 'docker' do
    arch 'amd64'
    uri 'https://download.docker.com/linux/ubuntu'
    key 'https://download.docker.com/linux/ubuntu/gpg'
    components ['stable']
    action :add
  end

  docker_version = "5:#{new_resource.version}~3-0~ubuntu-#{shell_out('lsb_release -cs').stdout.strip}"
  apt_package 'docker-ce' do
    action :install
    version docker_version
  end

  group 'docker' do
    append true
    members shell_out('echo ${SUDO_USER:-${USER}}').stdout.strip
    action :create
  end
end
