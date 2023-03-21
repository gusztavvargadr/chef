unified_mode true

provides :gusztavvargadr_chef_repository, platform: 'ubuntu'

default_action :add

action :add do
  apt_repository 'chef' do
    uri 'https://packages.chef.io/repos/apt/stable'
    key 'https://packages.chef.io/chef.asc'
    components ['main']
    action :add
  end
end
