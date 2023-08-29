unified_mode true

provides :gusztavvargadr_vsts_tool, platform: 'ubuntu'

property :options, Hash, default: {}

default_action :install

action :initialize do
  options = node['gusztavvargadr_vsts']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  agent_user = options['user']
  return if agent_user.to_s.empty?

  agent_user_home = "/home/#{agent_user}"

  user agent_user do
    home agent_user_home
    manage_home true
    action :create
  end

  group agent_user do
    members [ agent_user, shell_out('echo ${SUDO_USER:-${USER}}').stdout.strip ]
    action :create
  end
end

action :install do
  options = node['gusztavvargadr_vsts']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  agent_version = options['version']
  agent_arch = options['arch']
  agent_user = options['user']
  return if agent_version.to_s.empty? || agent_arch.to_s.empty? || agent_user.to_s.empty?

  agent_user_work = "/#{agent_user}"

  directory agent_user_work do
    owner agent_user
    group agent_user
    action :create
  end

  if ::Dir.empty?(agent_user_work)
    agent_archive_name = "vsts-agent-linux-#{agent_arch}-#{agent_version}.tar.gz"
    agent_archive_download_uri = "https://vstsagentpackage.azureedge.net/agent/#{agent_version}/#{agent_archive_name}"
    agent_archive_local_path = "#{Chef::Config['file_cache_path']}/#{agent_archive_name}"

    remote_file agent_archive_local_path do
      source agent_archive_download_uri
      action :create
    end

    archive_file agent_archive_local_path do
      destination agent_user_work
      owner agent_user
      group agent_user
      overwrite :auto
      action :extract
    end

    agent_install_dependencies_script_path = 'bin/installdependencies.sh'
    execute 'installdependencies.sh' do
      command "bash #{agent_install_dependencies_script_path}"
      cwd agent_user_work
      action :run
    end
  end
end

action :configure do
  options = node['gusztavvargadr_vsts']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  agent_user = options['user']
  return if agent_user.to_s.empty?

  agent_user_home = "/home/#{agent_user}"
  agent_user_work = "/#{agent_user}"

  agent_config = options['config']
  return if agent_config['url'].to_s.empty?

  agent_env_file_path = "#{agent_user_work}/.env"
  return if ::File.exist?(agent_env_file_path)

  agent_env_vars = ({
    'HOME' => agent_user_home,
  }).merge(agent_config['env'])
  file agent_env_file_path do
    content (agent_env_vars.map { |key, value| "#{key}=#{value}" }).join($RS).concat($RS)
    owner agent_user
    group agent_user
    action :create
  end

  agent_config_script_path = 'config.sh'

  agent_config_agent = agent_config['agent']
  unless agent_config_agent.to_s.empty?
    agent_config_agent = "#{agent_config_agent}-#{::SecureRandom.hex}"
  end

  agent_config_script_environment = {
    'VSTS_AGENT_INPUT_URL' => agent_config['url'],
    'VSTS_AGENT_INPUT_AUTH' => agent_config['auth'],
    'VSTS_AGENT_INPUT_TOKEN' => agent_config['token'],
    'VSTS_AGENT_INPUT_POOL' => agent_config['pool'],
    'VSTS_AGENT_INPUT_AGENT' =>  agent_config_agent,
  }

  execute 'config' do
    command "bash #{agent_config_script_path} --unattended --acceptTeeEula"
    cwd agent_user_work
    user agent_user
    environment agent_config_script_environment
    action :run
  end

  agent_svc_script_path = 'svc.sh'

  execute 'install' do
    command "bash #{agent_svc_script_path} install #{agent_user}"
    cwd agent_user_work
    action :nothing
    subscribes :run, 'execute[config]', :immediately
  end

  execute 'start' do
    command "bash #{agent_svc_script_path} start"
    cwd agent_user_work
    action :nothing
    subscribes :run, 'execute[install]', :immediately
  end
end

action :remove do
  options = node['gusztavvargadr_vsts']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  agent_user = options['user']
  return if agent_user.to_s.empty?

  agent_user_work = "/#{agent_user}"

  agent_svc_script_path = 'svc.sh'

  if ::File.exist?(::File.expand_path(agent_svc_script_path, agent_user_work))
    execute 'stop' do
      command "bash #{agent_svc_script_path} stop"
      cwd agent_user_work
      action :run
    end

    execute 'uninstall' do
      command "bash #{agent_svc_script_path} uninstall"
      cwd agent_user_work
      action :run
    end

    agent_config = options['config']

    unless agent_config['token'].to_s.empty?
      agent_config_script_path = 'config.sh'
      agent_config_script_environment = {
        'VSTS_AGENT_INPUT_AUTH' => agent_config['auth'],
        'VSTS_AGENT_INPUT_TOKEN' => agent_config['token'],
      }
      execute 'config remove' do
        command "bash #{agent_config_script_path} remove"
        cwd agent_user_work
        user agent_user
        environment agent_config_script_environment
        action :run
      end
    end
  end

  directory agent_user_work do
    recursive true
    action :delete
  end
end
