unified_mode true

provides :gusztavvargadr_hashicorp_repository, platform: 'ubuntu'

default_action :add

action :add do
  apt_repository 'hashicorp' do
    uri 'https://apt.releases.hashicorp.com'
    key 'https://apt.releases.hashicorp.com/gpg'
    components ['main']
    action :add
  end

  apt_package 'mkisofs' do
    action :install
  end
end
