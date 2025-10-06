unified_mode true

provides :gusztavvargadr_docker_tool, platform: 'ubuntu'

property :options, Hash, default: {}

default_action :install

action :initialize do
  _ = node['gusztavvargadr_docker']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  apt_repository_arch = shell_out('dpkg --print-architecture').stdout.strip

  apt_repository 'docker' do
    uri 'https://download.docker.com/linux/ubuntu'
    key 'https://download.docker.com/linux/ubuntu/gpg'
    components ['stable']
    arch apt_repository_arch
    trusted true
    action :add
  end
end

action :install do
  _ = node['gusztavvargadr_docker']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  apt_package [ 'docker-ce', 'docker-compose-plugin' ] do
    action :install
  end
end

action :configure do
  options = node['gusztavvargadr_docker']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  users = options['users'].keys
  users.append shell_out('echo ${SUDO_USER:-${USER}}').stdout.strip

  group 'docker' do
    members users
    append true
    action :create
  end

  service 'docker' do
    action [ :stop, :start, :enable ]
  end
end
