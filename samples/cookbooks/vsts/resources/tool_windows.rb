unified_mode true

provides :gusztavvargadr_vsts_tool, platform: 'windows'

property :options, Hash, default: {}

default_action :install

action :install do
  options = node['gusztavvargadr_vsts']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  agent_version = options['version']
  agent_arch = options['arch']
  return if agent_version.to_s.empty? || agent_arch.to_s.empty?

  agent_home = ENV['USERPROFILE']
  agent_work = "#{agent_home}/opt/vsts-agent"

  directory agent_work do
    recursive true
    action :create
  end

  return unless ::Dir.empty?(agent_work)

  agent_archive_name = "vsts-agent-win-#{agent_arch}-#{agent_version}.zip"
  agent_archive_download_uri = "https://vstsagentpackage.azureedge.net/agent/#{agent_version}/#{agent_archive_name}"
  agent_archive_local_path = "#{Chef::Config['file_cache_path']}/#{agent_archive_name}"

  remote_file agent_archive_local_path do
    source agent_archive_download_uri
    action :create
  end

  archive_file agent_archive_local_path do
    destination agent_work
    overwrite :auto
    action :extract
  end
end

action :configure do
  options = node['gusztavvargadr_vsts']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  agent_config = options['config']
  return if agent_config['url'].to_s.empty?

  agent_home = ENV['USERPROFILE']
  agent_work = "#{agent_home}/opt/vsts-agent"

  agent_env_file_path = "#{agent_work}/.env"
  return if ::File.exist?(agent_env_file_path)

  agent_env_vars = agent_config['env'] || {}
  file agent_env_file_path do
    content (agent_env_vars.map { |key, value| "#{key}=#{value}" }).join($RS).concat($RS)
    action :create
  end

  agent_config_script_path = 'config.cmd'

  agent_config_agent = agent_config['agent']
  unless agent_config_agent.to_s.empty?
    agent_config_agent = "#{agent_config_agent}-#{::SecureRandom.hex}"
  end

  agent_config_script_environment = {
    'VSTS_AGENT_INPUT_URL' => agent_config['url'],
    'VSTS_AGENT_INPUT_AUTH' => agent_config['auth'],
    'VSTS_AGENT_INPUT_TOKEN' => agent_config['token'],
    'VSTS_AGENT_INPUT_POOL' => agent_config['pool'],
    'VSTS_AGENT_INPUT_AGENT' => agent_config_agent,
  }

  execute 'config' do
    command "#{agent_config_script_path} --unattended --acceptTeeEula"
    cwd agent_work
    environment agent_config_script_environment
    action :run
  end
end

action :remove do
  options = node['gusztavvargadr_vsts']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  agent_config = options['config']
  return if agent_config['url'].to_s.empty?

  agent_home = ENV['USERPROFILE']
  agent_work = "#{agent_home}/opt/vsts-agent"

  agent_env_file_path = "#{agent_work}/.env"
  return unless ::File.exist?(agent_env_file_path)

  agent_config_script_path = 'config.cmd'

  agent_config_script_environment = {
    'VSTS_AGENT_INPUT_AUTH' => agent_config['auth'],
    'VSTS_AGENT_INPUT_TOKEN' => agent_config['token'],
  }

  execute 'config remove' do
    command "#{agent_config_script_path} remove"
    cwd agent_work
    environment agent_config_script_environment
    action :run
  end

  directory agent_work do
    recursive true
    action :delete
  end
end
