unified_mode true

provides :gusztavvargadr_chef_app, platform: 'windows'

property :options, Hash, default: {}

default_action :install

action :install do
  app_name = new_resource.options['name']
  app_version = new_resource.options['version']
  return if app_name.to_s.empty? || app_version.to_s.empty?

  chocolatey_package app_name do
    version app_version unless app_version == 'latest'
    action :install
  end
end