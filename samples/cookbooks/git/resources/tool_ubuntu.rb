unified_mode true

provides :gusztavvargadr_git_tool, platform: 'ubuntu'

property :options, Hash, default: {}

default_action :install

action :initialize do
  _ = node['gusztavvargadr_git']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  apt_repository 'git' do
    uri 'ppa:git-core/ppa'
    action :add
  end
end

action :install do
  options = node['gusztavvargadr_git']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  apt_package options['package'] do
    action :install
  end
end
