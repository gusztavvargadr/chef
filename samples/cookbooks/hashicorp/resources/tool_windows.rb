unified_mode true

provides :gusztavvargadr_hashicorp_tool, platform: 'windows'

property :options, Hash, default: {}

default_action :install

action :initialize do
  _ = node['gusztavvargadr_hashicorp']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)
end

action :install do
  options = node['gusztavvargadr_hashicorp']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  chocolatey_package options['package'] do
    returns [ 0, 2, 3010 ]
    action :install
  end

  reboot_packages = %w(vagrant)
  if reboot_packages.include? options['package']
    reboot "gusztavvargadr_hashicorp_tool[#{new_resource.name}]" do
      action :nothing
      subscribes :request_reboot, "chocolatey_package[#{options['package']}]", :immediately
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
