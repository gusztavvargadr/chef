unified_mode true

provides :gusztavvargadr_chef_tool, platform: 'ubuntu'

property :options, Hash, default: {}

default_action :install

action :initialize do
  _ = node['gusztavvargadr_chef']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  apt_repository_distribution = shell_out('lsb_release -cs').stdout.strip
  apt_repository_distribution = apt_repository_distribution == 'jammy' ? 'focal' : apt_repository_distribution

  apt_repository 'chef' do
    uri 'https://packages.chef.io/repos/apt/stable'
    key 'https://packages.chef.io/chef.asc'
    components ['main']
    distribution apt_repository_distribution
    action :add
  end

  apt_package 'build-essential' do
    action :install
  end
end

action :install do
  options = node['gusztavvargadr_chef']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  apt_package options['package'] do
    action :install
  end
end
