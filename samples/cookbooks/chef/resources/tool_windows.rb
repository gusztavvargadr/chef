unified_mode true

provides :gusztavvargadr_chef_tool, platform: 'windows'

property :options, Hash, default: {}

default_action :install

action :initialize do
  _ = node['gusztavvargadr_chef']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)
end

action :install do
  options = node['gusztavvargadr_chef']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  powershell_script 'chef_install' do
    code <<-EOH
      iwr -useb https://omnitruck.chef.io/install.ps1 | iex; install -project #{options['project']} -install_strategy once
    EOH
    action :run
  end
end
