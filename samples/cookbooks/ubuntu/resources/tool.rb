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

  if packages.include? 'xubuntu-desktop'
    file '/etc/X11/default-display-manager' do
      content '/usr/sbin/lightdm'
      action :create
      notifies :run, 'bash[dpk-reconfigure-lightdm]', :immediately
    end

    bash 'dpk-reconfigure-lightdm' do
      code <<~EOH
        DEBIAN_FRONTEND=noninteractive dpkg-reconfigure lightdm
      EOH
      action :nothing
    end

    link '/etc/alternatives/x-session-manager' do
      to '/usr/bin/xfce4-session'
      action :create
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
