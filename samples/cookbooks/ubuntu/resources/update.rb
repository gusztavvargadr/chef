unified_mode true

provides :gusztavvargadr_ubuntu_update, platform: 'ubuntu'

property :options, Hash, default: {}

default_action :dist_upgrade

action :initialize do
  apt_update "gusztavvargadr_ubuntu_update[#{new_resource.name}]" do
    action :update
  end
end

action :dist_upgrade do
  bash "gusztavvargadr_ubuntu_update[#{new_resource.name}]" do
    code <<~EOH
      apt-get -y -qq -o Dpkg::Options::=--force-confold -o Dpkg::Options::=--force-confdef dist-upgrade
    EOH
    environment 'DEBIAN_FRONTEND' => 'noninteractive'
    action :run
    not_if { shell_out('apt list --upgradable -qq').stdout.empty? }
  end
end

action :cleanup do
  bash "gusztavvargadr_ubuntu_update[#{new_resource.name}]" do
    code <<~EOH
      apt-get -y -qq autoremove
      apt-get -y -qq clean
    EOH
    environment 'DEBIAN_FRONTEND' => 'noninteractive'
    action :run
  end
end
