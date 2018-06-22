property :engine_edition, String, name_property: true
property :engine_mode, String, default: node['gusztavvargadr_docker']['engine']['mode']

default_action :install

action :prepare do
  engine_platform = node['platform']
  engine_options = node['gusztavvargadr_docker']['engine'][engine_platform][engine_edition]

  case engine_platform
  when 'windows'
    gusztavvargadr_windows_features '' do
      features_options engine_options['features']
    end

    case engine_edition
    when 'enterprise'
      powershell_script 'Install PowerShell module \'DockerProvider\'' do
        code <<-EOH
          Install-Module DockerProvider -Force
        EOH
        action :run
      end
    end
  end
end

action :install do
  engine_platform = node['platform']
  engine_options = node['gusztavvargadr_docker']['engine'][engine_platform][engine_edition]

  case engine_platform
  when 'windows'
    gusztavvargadr_windows_native_packages '' do
      native_packages_options engine_options['native_packages']
    end

    case engine_edition
    when 'enterprise'
      powershell_script 'Install PowerShell package \'Docker\'' do
        code <<-EOH
          Install-Package Docker -ProviderName DockerProvider -Force
        EOH
        action :run
      end
    end
  end
end

action :switch do
  engine_platform = node['platform']

  case engine_platform
  when 'windows'
    case engine_edition
    when 'community'
      powershell_script 'Switch Docker daemon' do
        code <<-EOH
          & 'C:\\Program Files\\Docker\\Docker\\DockerCli.exe' -SwitchDaemon
        EOH
        action :run
        not_if "(docker version --format '{{.Server.Os}}') -eq '#{engine_mode}'"
      end
    end
  end
end
