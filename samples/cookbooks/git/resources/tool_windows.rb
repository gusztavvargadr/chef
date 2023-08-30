unified_mode true

provides :gusztavvargadr_git_tool, platform: 'windows'

property :options, Hash, default: {}

default_action :install

action :initialize do
  _ = node['gusztavvargadr_git']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)
end

action :install do
  options = node['gusztavvargadr_git']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  chocolatey_package options['package'] do
    options '--params "/NoShellIntegration /SChannel /NoOpenSSH"'
    action :upgrade
  end
end
