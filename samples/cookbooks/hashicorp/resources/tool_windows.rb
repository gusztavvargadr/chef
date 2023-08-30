unified_mode true

provides :gusztavvargadr_hashicorp_tool, platform: 'windows'

property :options, Hash, default: {}

default_action :install

action :initialize do
  _ = node['gusztavvargadr_hashicorp']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)
end

action :install do
  options = node['gusztavvargadr_hashicorp']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  reboot_packages = %w(vagrant)

  package_name = options['package'].to_s
  package_version = options['version'].to_s
  package_returns = reboot_packages.include?(options['package']) ? [ 0, 2, 3010 ] : []

  chocolatey_package package_name do
    version package_version unless package_version.empty?
    returns package_returns unless package_returns.empty?
    action :install
  end

  if reboot_packages.include? options['package']
    reboot "gusztavvargadr_hashicorp_tool[#{new_resource.name}]" do
      action :nothing
      subscribes :reboot_now, "chocolatey_package[#{options['package']}]", :immediately
    end
  end
end

action :configure do
  options = node['gusztavvargadr_hashicorp']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  service_packages = %w(consul consul-template)
  if service_packages.include? options['package']
    service options['package'] do
      action [ :stop, :disable ]
    end
  end
end
