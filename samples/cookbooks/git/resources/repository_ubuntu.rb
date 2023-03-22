unified_mode true

provides :gusztavvargadr_git_repository, platform: 'ubuntu'

default_action :add

action :add do
  apt_repository 'git' do
    uri 'ppa:git-core/ppa'
    action :add
  end
end
