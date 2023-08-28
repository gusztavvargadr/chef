unified_mode true

provides :gusztavvargadr_ubuntu_update

property :options, Hash, default: {}

default_action :install

action :initialize do
  apt_update "gusztavvargadr_ubuntu_update[#{new_resource.name}]" do
    action :update
  end
end

action :install do
  bash "gusztavvargadr_ubuntu_update[#{new_resource.name}]" do
    code <<-EOH
      apt-get #{new_resource.name} -y -qq
    EOH
    not_if { shell_out('apt list --upgradable -qq').stdout.empty? }
  end
end

action :cleanup do
  bash "gusztavvargadr_ubuntu_update[#{new_resource.name}]" do
    code <<-EOH
      apt-get autoremove -y -qq
      apt-get clean -y -qq
    EOH
  end
end
