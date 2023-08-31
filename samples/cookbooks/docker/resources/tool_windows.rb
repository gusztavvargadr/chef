unified_mode true

provides :gusztavvargadr_docker_tool, platform: 'windows'

property :options, Hash, default: {}

default_action :install

action :initialize do
  options = node['gusztavvargadr_docker']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  features = options['features']
  features.each do |feature_name, _|
    windows_feature_dism feature_name do
      all true
      action :install
    end

    reboot "gusztavvargadr_docker_tool[#{new_resource.name}]" do
      action :nothing
      subscribes :reboot_now, "windows_feature_dism[#{feature_name}]"
    end
  end
end

action :install do
  options = node['gusztavvargadr_docker']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  tmp_directory_path = "#{Chef::Config['file_cache_path']}/gusztavvargadr_docker_tool"
  directory tmp_directory_path do
    recursive true
    action :create
  end

  powershell_source = options['powershell_source']
  powershell_target = "#{tmp_directory_path}/install.ps1"
  remote_file powershell_target do
    source powershell_source
    action :create
  end

  powershell_script 'gusztavvargadr_docker_install' do
    code "#{powershell_target} -NoRestart"
    action :nothing
    subscribes :run, "remote_file[#{powershell_target}]", :immediately
  end

  compose_source = options['compose_source']
  plugin_directory = "#{powershell_out('$env:ProgramFiles').stdout.strip}\\Docker\\cli-plugins"
  directory plugin_directory do
    recursive true
    action :create
  end

  plugin_target = "#{plugin_directory}\\docker-compose.exe"
  remote_file plugin_target do
    source compose_source
    action :create
  end
end

action :configure do
  options = node['gusztavvargadr_docker']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  users = options['users'].keys
  users.append powershell_out('$env:USERNAME').stdout.strip

  group 'docker' do
    members users
    append true
    action :create
  end

  service 'docker' do
    action [ :stop, :start, :enable ]
  end
end
