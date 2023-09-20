unified_mode true

provides :gusztavvargadr_ubuntu_update

property :options, Hash, default: {}

default_action :dist_upgrade

action :initialize do
  apt_update "gusztavvargadr_ubuntu_update[#{new_resource.name}]" do
    action :update
  end
end

action :dist_upgrade do
  bash "gusztavvargadr_ubuntu_update[#{new_resource.name}]" do
    code <<-EOH
      DEBIAN_FRONTEND=noninteractive apt-get -y -qq -o Dpkg::Options::=--force-confold -o Dpkg::Options::=--force-confdef dist-upgrade
    EOH
    not_if { shell_out('apt list --upgradable -qq').stdout.empty? }
  end

  reboot 'gusztavvargadr_ubuntu_update' do
    action :request_reboot
    only_if { reboot_pending? }
  end
end

action :cleanup do
  bash "gusztavvargadr_ubuntu_update[#{new_resource.name}]" do
    code <<-EOH
      apt-get -y -qq autoremove
      apt-get -y -qq clean
    EOH
  end
end
