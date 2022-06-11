unified_mode true

provides :gusztavvargadr_vagrant_app, platform: 'windows'

property :options, Hash, default: {}

default_action :install

action :install do
  app_version = new_resource.options['version']
  return if app_version.to_s.empty?

  reboot 'vagrant-app-install' do
    action :nothing
  end

  chocolatey_package 'vagrant' do
    version app_version unless app_version == 'latest'
    returns [0, 2, 3010]
    action :upgrade
    notifies :request_reboot, 'reboot[vagrant-app-install]'
  end
end
