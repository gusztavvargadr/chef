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
    notifies :request_reboot, 'reboot[gusztavvargadr_docker_engine_prepare]'
  end

  reboot 'gusztavvargadr_docker_engine_prepare' do
    action :nothing
  end
end

action :install do
  return if new_resource.edition.to_s.empty?

  options = node['gusztavvargadr_docker']['engine']["#{new_resource.edition}"]['windows']

  powershell_source = options['powershell_source']
  unless powershell_source.empty?
    powershell_target = "#{Chef::Config['file_cache_path']}/gusztavvargadr_docker_install.ps1"
    remote_file powershell_target do
      source powershell_source
      action :create
      notifies :run, 'powershell_script[gusztavvargadr_docker_install]'
    end

    powershell_script 'gusztavvargadr_docker_install' do
      code "#{powershell_target} -NoRestart"
      action :nothing
      notifies :request_reboot, 'reboot[gusztavvargadr_docker_engine_install]'
    end
  end

  gusztavvargadr_windows_native_packages '' do
    options options['native_packages']
    action :install
    notifies :request_reboot, 'reboot[gusztavvargadr_docker_engine_install]'
  end

  reboot 'gusztavvargadr_docker_engine_install' do
    action :nothing
  end

  compose_source = options['compose_source']
  unless compose_source.empty?
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
  end
end
