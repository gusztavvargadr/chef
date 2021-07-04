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

  apt_repository 'docker' do
    arch 'amd64'
    uri 'https://download.docker.com/linux/ubuntu'
    key 'https://download.docker.com/linux/ubuntu/gpg'
    components ['stable']
    action :add
  end

  %w(docker-ce docker-ce-cli containerd.io).each do |package_name|
    apt_package package_name do
      action :install
    end
  end

  group 'docker' do
    append true
    members shell_out('echo ${SUDO_USER:-${USER}}').stdout.strip
    action :create
  end
end
