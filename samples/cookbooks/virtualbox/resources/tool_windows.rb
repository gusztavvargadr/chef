unified_mode true

provides :gusztavvargadr_virtualbox_tool, platform: 'windows'

property :options, Hash, default: {}

default_action :install

action :initialize do
  _ = node['gusztavvargadr_virtualbox']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)
end

action :install do
  options = node['gusztavvargadr_virtualbox']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  package_name = options['package'].to_s
  package_version = options['version'].to_s

  chocolatey_package package_name do
    version package_version unless package_version.empty?
    options '--params "/ExtensionPack"'
    action :install
  end
end
