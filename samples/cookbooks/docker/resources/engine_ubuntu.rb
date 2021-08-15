unified_mode true

provides :gusztavvargadr_docker_engine, platform: 'ubuntu'

property :version, String, default: ''
property :edition, String, default: ''

default_action :install

action :prepare do
  return unless new_resource.edition.to_s == 'community'

  %w(apt-transport-https ca-certificates curl gnupg lsb-release).each do |package_name|
    apt_package package_name do
      action :install
    end
  end
end

action :install do
  return unless new_resource.edition.to_s == 'community'

  options = node['gusztavvargadr_docker']['engine']["#{new_resource.edition}"]['ubuntu']

  apt_repository 'docker' do
    arch 'amd64'
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

  docker_compose_version = options['docker-compose']['version']
  docker_compose_source = "https://github.com/docker/compose/releases/download/#{docker_compose_version}/docker-compose-#{shell_out('uname -s').stdout.strip}-#{shell_out('uname -m').stdout.strip}"
  remote_file '/usr/local/bin/docker-compose' do
    source docker_compose_source
    mode '0755'
    action :create
  end

  docker_compose_completion_source = "https://raw.githubusercontent.com/docker/compose/#{docker_compose_version}/contrib/completion/bash/docker-compose"
  remote_file '/etc/bash_completion.d/docker-compose' do
    source docker_compose_completion_source
    action :create
  end
end
