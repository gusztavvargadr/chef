unified_mode true

provides :gusztavvargadr_chef_app, platform: 'ubuntu'

property :options, Hash, default: {}

default_action :install

action :install do
  app_name = new_resource.options['name']
  app_version = new_resource.options['version']
  return if app_name.to_s.empty? || app_version.to_s.empty?

  apt_package app_name do
    action :install
  end
end
