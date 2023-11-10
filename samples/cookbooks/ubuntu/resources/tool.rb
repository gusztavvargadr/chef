unified_mode true

provides :gusztavvargadr_ubuntu_tool, platform: 'ubuntu'

property :options, Hash, default: {}

default_action :install

action :initialize do
  _ = node['gusztavvargadr_ubuntu']['options']['tools'][new_resource.name].merge(new_resource.options)

  apt_update "gusztavvargadr_ubuntu_tool[#{new_resource.name}]" do
    action :update
  end
end

action :install do
  options = node['gusztavvargadr_ubuntu']['options']['tools'][new_resource.name].merge(new_resource.options)

  packages = options['packages']
  packages.each do |package_name|
    apt_package package_name do
      action :install
    end
  end
end

action :configure do
  _ = node['gusztavvargadr_ubuntu']['options']['tools'][new_resource.name].merge(new_resource.options)

  group 'ssl-cert' do
    members [ 'xrdp' ]
    append true
    action :create
  end

  service 'xrdp' do
    action [ :stop, :start, :enable ]
  end
end
