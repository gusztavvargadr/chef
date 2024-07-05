unified_mode true

provides :gusztavvargadr_chef_tool, platform: 'ubuntu'

property :options, Hash, default: {}

default_action :install

action :initialize do
  _ = node['gusztavvargadr_chef']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  apt_package 'build-essential' do
    action :install
  end
end

action :install do
  options = node['gusztavvargadr_chef']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  bash 'chef_install' do
    code <<~EOH
      curl -L https://omnitruck.chef.io/install.sh | sudo bash -s -- -P #{options['project']} -s once
    EOH
    action :run
  end
end
