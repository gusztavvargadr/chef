unified_mode true

provides :gusztavvargadr_hashicorp_tool, platform: 'ubuntu'

property :options, Hash, default: {}

default_action :install

action :initialize do
  _ = node['gusztavvargadr_hashicorp']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  apt_repository 'hashicorp' do
    uri 'https://apt.releases.hashicorp.com'
    key 'https://apt.releases.hashicorp.com/gpg'
    components ['main']
    action :add
  end
end

action :install do
  options = node['gusztavvargadr_hashicorp']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  apt_package options['package'] do
    action :install
  end
end

action :configure do
  options = node['gusztavvargadr_hashicorp']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  service_packages = %w(consul vault)
  if service_packages.include? options['package']
    service options['package'] do
      action [ :stop, :disable ]
    end
  end
end
