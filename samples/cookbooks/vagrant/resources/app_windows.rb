unified_mode true

provides :gusztavvargadr_vagrant_app, platform: 'windows'

property :version, String, default: ''

default_action :install

action :install do
  return if new_resource.version.to_s.empty?

  reboot 'vagrant-app-install' do
    action :nothing
  end

  chocolatey_package 'vagrant' do
    version new_resource.version unless new_resource.version == 'latest'
    returns [0, 2, 3010]
    action :install
    notifies :request_reboot, 'reboot[vagrant-app-install]'
  end
end
