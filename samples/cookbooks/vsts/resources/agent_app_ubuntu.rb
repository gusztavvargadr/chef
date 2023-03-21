unified_mode true

provides :gusztavvargadr_vsts_agent_app, platform: 'ubuntu'

property :options, Hash, default: {}

default_action :add

action :prepare do
  agent_user = new_resource.options['user']
  return if agent_user.to_s.empty?

  agent_user_home = "/home/#{agent_user}"

  user agent_user do
    home agent_user_home
    action :create
  end

  group agent_user do
    members [ agent_user, shell_out('echo ${SUDO_USER:-${USER}}').stdout.strip ]
    action :create
  end

  directory agent_user_home do
    owner agent_user
    group agent_user
    action :create
  end
end

action :add do
  agent_name = new_resource.options['name']
  agent_version = new_resource.options['version']
  agent_arch = new_resource.options['arch']
  agent_user = new_resource.options['user']
  return if agent_name.to_s.empty? || agent_version.to_s.empty? || agent_arch.to_s.empty? || agent_user.to_s.empty?

  agent_user_home = "/home/#{agent_user}"

  agent_archive_name = "vsts-agent-linux-#{agent_arch}-#{agent_version}.tar.gz"
  agent_archive_download_uri = "https://vstsagentpackage.azureedge.net/agent/#{agent_version}/#{agent_archive_name}"
  agent_archive_local_path = "#{Chef::Config['file_cache_path']}/#{agent_archive_name}"

  remote_file agent_archive_local_path do
    source agent_archive_download_uri
    action :create
  end

  archive_file agent_archive_local_path do
    destination agent_user_home
    owner agent_user
    group agent_user
    overwrite :auto
    action :extract
    notifies :run, 'execute[installdependencies.sh]'
  end

  agent_install_dependencies_script_path = "./bin/installdependencies.sh"
  execute 'installdependencies.sh' do
    command agent_install_dependencies_script_path
    cwd agent_user_home
    action :nothing
  end

  agent_env_file_path = "#{agent_user_home}/.env"
  file agent_env_file_path do
    content <<-EOH
HOME=#{agent_user_home}
CHEF_LICENSE=accept-silent

VSTS_AGENT_CAP_OS=linux
    EOH
    owner agent_user
    group agent_user
    action :create
  end

  unless new_resource.options['url'].to_s.empty?
    agent_config_script_path = "./config.sh"
    agent_config_script_environment = {
      'VSTS_AGENT_INPUT_URL' => new_resource.options['url'],
      'VSTS_AGENT_INPUT_AUTH' => new_resource.options['auth'] || 'pat',
      'VSTS_AGENT_INPUT_TOKEN' => new_resource.options['token'],
      'VSTS_AGENT_INPUT_POOL' => new_resource.options['pool'] || 'Default',
      'VSTS_AGENT_INPUT_AGENT' => new_resource.options['agent'] || "linux-core-#{::SecureRandom.hex}",
    }
    agent_svc_script_path = "./svc.sh"
    agent_runsvc_script_path = "./runsvc.sh"
  
    execute 'config' do
      command "#{agent_config_script_path} --unattended --acceptTeeEula"
      cwd agent_user_home
      user agent_user
      environment agent_config_script_environment
      action :run
      not_if { ::File.exist?(::File.expand_path(agent_svc_script_path, agent_user_home)) }
    end

    execute 'install' do
      command "#{agent_svc_script_path} install #{agent_user}"
      cwd agent_user_home
      action :run
      not_if { ::File.exist?(::File.expand_path(agent_runsvc_script_path, agent_user_home)) }
      notifies :run, 'execute[start]'
    end

    execute 'start' do
      command "#{agent_svc_script_path} start"
      cwd agent_user_home
      action :nothing
    end
  end
end

action :remove do
  agent_user = new_resource.options['user']
  return if agent_user.to_s.empty?

  agent_user_home = "/home/#{agent_user}"
  agent_svc_script_path = "./svc.sh"

  if ::File.exist?(::File.expand_path(agent_svc_script_path, agent_user_home))
    execute 'stop' do
      command "#{agent_svc_script_path} stop"
      cwd agent_user_home
      action :run
    end

    execute 'uninstall' do
      command "#{agent_svc_script_path} uninstall"
      cwd agent_user_home
      action :run
    end

    agent_config_script_path = "./config.sh"
    agent_config_script_environment = {
      'VSTS_AGENT_INPUT_AUTH' => new_resource.options['auth'] || 'pat',
      'VSTS_AGENT_INPUT_TOKEN' => new_resource.options['token'],
    }
    execute 'config remove' do
      command "#{agent_config_script_path} remove"
      cwd agent_user_home
      user agent_user
      environment agent_config_script_environment
      action :run
    end
  end

  directory agent_user_home do
    recursive true
    action :delete
  end
end
