unified_mode true

provides :gusztavvargadr_virtualbox_app, platform: 'windows'

property :options, Hash, default: {}

default_action :install

action :install do
  app_name = new_resource.options['name']
  app_version = new_resource.options['version']
  return if app_name.to_s.empty? || app_version.to_s.empty?

  if app_name == 'core'
    chocolatey_package 'virtualbox' do
      version app_version unless app_version == 'latest'
      options '--params "/ExtensionPack"'
      action :install
    end
  end
end
