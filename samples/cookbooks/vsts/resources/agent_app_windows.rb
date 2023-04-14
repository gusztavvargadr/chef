unified_mode true

provides :gusztavvargadr_vsts_agent_app, platform: 'windows'

property :options, Hash, default: {}

default_action :install

action :prepare do
  agent_user = new_resource.options['user']
  agent_password = new_resource.options['password']
  return if agent_user.to_s.empty? || agent_password.to_s.empty?

  agent_user_home = "C:/Users/#{agent_user}"

  user agent_user do
    home agent_user_home
    manage_home true
    password agent_password
    action :create
  end
end

action :add do
  agent_version = new_resource.options['version']
  agent_arch = new_resource.options['arch']
  agent_user = new_resource.options['user']
  agent_password = new_resource.options['password']
  return if agent_version.to_s.empty? || agent_arch.to_s.empty? || agent_user.to_s.empty? || agent_password.to_s.empty?

  agent_user_home = "C:/Users/#{agent_user}"
  agent_user_work = "C:/#{agent_user}"

  directory agent_user_work do
    owner agent_user
    action :create
  end

  agent_archive_name = "vsts-agent-win-#{agent_arch}-#{agent_version}.zip"
  agent_archive_download_uri = "https://vstsagentpackage.azureedge.net/agent/#{agent_version}/#{agent_archive_name}"
  agent_archive_local_path = "#{Chef::Config['file_cache_path']}/#{agent_archive_name}"

  remote_file agent_archive_local_path do
    source agent_archive_download_uri
    action :create
  end

  archive_file agent_archive_local_path do
    destination agent_user_work
    owner agent_user
    overwrite :auto
    action :extract
  end

  agent_env_file_path = "#{agent_user_work}/.env"
  file agent_env_file_path do
    content <<-EOH
HOME=#{agent_user_home}

CHEF_LICENSE=accept-silent

VSTS_AGENT_CAP_OS=windows
    EOH
    owner agent_user
    action :create
  end

  agent_config = new_resource.options['config']

  unless agent_config['token'].to_s.empty?
    agent_config_script_path = 'config.cmd'
    agent_config_agent = agent_config['agent'].to_s.empty? ? node.name : agent_config['agent']
    agent_config_script_environment = {
      'VSTS_AGENT_INPUT_URL' => agent_config['url'],
      'VSTS_AGENT_INPUT_AUTH' => agent_config['auth'],
      'VSTS_AGENT_INPUT_TOKEN' => agent_config['token'],
      'VSTS_AGENT_INPUT_POOL' => agent_config['pool'],
      'VSTS_AGENT_INPUT_AGENT' => "windows-#{agent_config_agent}-#{::SecureRandom.hex}",
      'VSTS_AGENT_INPUT_RUNASSERVICE' => 'True',
      'VSTS_AGENT_INPUT_WINDOWSLOGONACCOUNT' => agent_user,
      'VSTS_AGENT_INPUT_WINDOWSLOGONPASSWORD' => agent_password,
    }

    execute 'config' do
      command "#{agent_config_script_path} --unattended --acceptTeeEula"
      cwd agent_user_work
      environment agent_config_script_environment
      action :run
    end
  end
end

action :remove do
  agent_user = new_resource.options['user']
  return if agent_user.to_s.empty?

  agent_user_work = "C:/#{agent_user}"

  agent_config_script_path = 'config.cmd'

  if ::File.exist?(::File.expand_path(agent_config_script_path, agent_user_work))
    agent_config = new_resource.options['config']

    unless agent_config['token'].to_s.empty?
      agent_config_script_environment = {
        'VSTS_AGENT_INPUT_AUTH' => agent_config['auth'],
        'VSTS_AGENT_INPUT_TOKEN' => agent_config['token'],
      }
      execute 'config remove' do
        command "#{agent_config_script_path} remove"
        cwd agent_user_work
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
