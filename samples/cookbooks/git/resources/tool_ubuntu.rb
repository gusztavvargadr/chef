unified_mode true

provides :gusztavvargadr_git_tool, platform: 'ubuntu'

property :options, Hash, default: {}

default_action :upgrade

action :initialize do
  _ = node['gusztavvargadr_git']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  apt_repository 'git' do
    uri 'ppa:git-core/ppa'
    key 'https://keyserver.ubuntu.com/pks/lookup?op=get&search=0xf911ab184317630c59970973e363c90f8f1b6217'
    trusted true
    action :add
  end
end

action :upgrade do
  options = node['gusztavvargadr_git']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  apt_package options['package'] do
    action :upgrade
  end
end
