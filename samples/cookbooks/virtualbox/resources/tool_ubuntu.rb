unified_mode true

provides :gusztavvargadr_virtualbox_tool, platform: 'ubuntu'

property :options, Hash, default: {}

default_action :install

action :initialize do
  _ = node['gusztavvargadr_virtualbox']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  apt_repository_arch = shell_out('dpkg --print-architecture').stdout.strip
  apt_repository 'virtualbox' do
    uri 'https://download.virtualbox.org/virtualbox/debian'
    key 'https://www.virtualbox.org/download/oracle_vbox_2016.asc'
    components ['contrib']
    arch apt_repository_arch
    action :add
  end

  apt_package 'build-essential' do
    action :install
  end
end

action :install do
  options = node['gusztavvargadr_virtualbox']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  apt_package options['package'] do
    action :install
  end

  virtualbox_version = shell_out('vboxmanage --version').stdout.strip.split('r')[0]
  virtualbox_extension_pack_list = shell_out('vboxmanage list extpacks').stdout.strip
  return if virtualbox_extension_pack_list.include?(virtualbox_version)

  virtualbox_extension_pack_file =
    if virtualbox_version.start_with?('7.0')
      "Oracle_VM_VirtualBox_Extension_Pack-#{virtualbox_version}.vbox-extpack"
    else
      "Oracle_VirtualBox_Extension_Pack-#{virtualbox_version}.vbox-extpack"
    end
  virtualbox_extension_pack_download_uri = "https://download.virtualbox.org/virtualbox/#{virtualbox_version}/#{virtualbox_extension_pack_file}"

  virtualbox_extension_pack_local_path = "#{Chef::Config['file_cache_path']}/#{virtualbox_extension_pack_file}"
  remote_file virtualbox_extension_pack_local_path do
    source virtualbox_extension_pack_download_uri
    action :create
  end

  virtualbox_extension_pack_hash =
    if virtualbox_version.start_with?('7.0')
      '33d7284dc4a0ece381196fda3cfe2ed0e1e8e7ed7f27b9a9ebc4ee22e24bd23c'
    else
      'eb31505e56e9b4d0fbca139104da41ac6f6b98f8e78968bdf01b1f3da3c4f9ae'
    end
  bash 'vboxmanage extpack install' do
    code <<~EOH
      vboxmanage extpack install --replace --accept-license=#{virtualbox_extension_pack_hash} #{virtualbox_extension_pack_local_path}
    EOH
    action :run
  end
end
