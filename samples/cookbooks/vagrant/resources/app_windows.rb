unified_mode true

provides :gusztavvargadr_vagrant_app, platform: 'windows'

property :options, Hash, default: {}

default_action :install

action :install do
  app_version = new_resource.options['version']
  return if app_version.to_s.empty?

  chocolatey_package 'vagrant' do
    version app_version unless app_version == 'latest'
    returns [0, 2, 3010]
    action :install
    notifies :request_reboot, 'reboot[gusztavvargadr_vagrant_app_install]'
  end

  reboot 'gusztavvargadr_vagrant_app_install' do
    action :nothing
  end
end
