unified_mode true

provides :gusztavvargadr_git_app, platform: 'windows'

property :options, Hash, default: {}

default_action :install

action :install do
  app_version = new_resource.options['version']
  return if app_version.to_s.empty?

  chocolatey_package 'git' do
    version app_version unless app_version == 'latest'
    options '--params "/NoShellIntegration /SChannel /NoOpenSSH"'
    action :install
  end
end
