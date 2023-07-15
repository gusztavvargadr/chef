unified_mode true

provides :gusztavvargadr_docker_engine, platform: 'windows'

property :edition, String, default: ''

default_action :install

action :prepare do
  return if new_resource.edition.to_s.empty?

  options = node['gusztavvargadr_docker']['engine']["#{new_resource.edition}"]['windows']

  gusztavvargadr_windows_features '' do
    options options['features']
    action :install
  end

  reboot 'gusztavvargadr_docker_engine_prepare' do
    action :nothing
    subscribes :request_reboot, 'gusztavvargadr_windows_features[]'
  end
end

action :install do
  return if new_resource.edition.to_s.empty?

  options = node['gusztavvargadr_docker']['engine']["#{new_resource.edition}"]['windows']

  powershell_source = options['powershell_source']
  powershell_target = "#{Chef::Config['file_cache_path']}/gusztavvargadr_docker_install.ps1"
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
  plugin_directory = "#{powershell_out('$env:ProgramFiles').stdout.strip}/Docker/cli-plugins"
  directory plugin_directory do
    recursive true
    action :create
  end

  plugin_target = "#{plugin_directory}/docker-compose.exe"
  remote_file plugin_target do
    source compose_source
    action :create
  end

  executable_directory = "#{powershell_out('$env:SystemRoot').stdout.strip}/System32"
  executable_target = "#{executable_directory}/docker-compose.exe"
  remote_file executable_target do
    source compose_source
    action :create
  end

  users = node['gusztavvargadr_docker']['engine']['users'].keys
  users.append powershell_out('$env:USERNAME').stdout.strip

  group 'docker' do
    members users
    append true
    action :create
  end

  service 'docker' do
    action [ :enable, :start ]
  end
end
