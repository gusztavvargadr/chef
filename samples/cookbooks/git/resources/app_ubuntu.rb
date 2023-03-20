unified_mode true

provides :gusztavvargadr_git_app, platform: 'ubuntu'

property :options, Hash, default: {}

default_action :upgrade

action :upgrade do
  app_version = new_resource.options['version']
  return if app_version.to_s.empty?

  apt_repository 'git' do
    uri 'ppa:git-core/ppa'
    action :add
  end

  apt_package 'git' do
    version app_version unless app_version == 'latest'
    action :upgrade
  end
end
