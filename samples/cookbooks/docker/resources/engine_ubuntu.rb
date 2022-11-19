unified_mode true

provides :gusztavvargadr_docker_engine, platform: 'ubuntu'

property :edition, String, default: ''

default_action :install

action :prepare do
  return unless new_resource.edition.to_s == 'community'
end

action :install do
  return unless new_resource.edition.to_s == 'community'

  apt_repository 'docker' do
    uri 'https://download.docker.com/linux/ubuntu'
    key 'https://download.docker.com/linux/ubuntu/gpg'
    components ['stable']
    action :add
  end

  apt_package [ 'docker-ce', 'docker-compose-plugin' ] do
    action :install
  end

  link '/usr/bin/docker-compose' do
    to '/usr/libexec/docker/cli-plugins/docker-compose'
    link_type :symbolic
    action :create
  end

  group 'docker' do
    members shell_out('echo ${SUDO_USER:-${USER}}').stdout.strip
    append true
    action :create
  end
end
