unified_mode true

provides :gusztavvargadr_azure_pipelines_agent, platform: 'ubuntu'

property :version, String, default: ''

default_action :install

action :prepare do
  apt_package 'xubuntu-desktop' do
    action :upgrade
  end

  apt_package 'apt-transport-https' do
    action :upgrade
  end

  apt_repository 'git' do
    uri 'ppa:git-core/ppa'
    action :add
  end

  apt_package 'git' do
    action :upgrade
  end

  dotnet_packages_download_uri = "https://packages.microsoft.com/config/ubuntu/#{shell_out('lsb_release -rs').stdout.strip}/packages-microsoft-prod.deb"
  dotnet_packages_local_path = "#{Chef::Config['file_cache_path']}/packages-microsoft-prod.deb"

  remote_file dotnet_packages_local_path do
    source dotnet_packages_download_uri
    action :create
  end

  dpkg_package 'dotnet-packages' do
    source dotnet_packages_local_path
    action :upgrade
  end

  apt_update '' do
    action :update
  end

  apt_package 'dotnet-sdk-3.1' do
    action :upgrade
  end

  apt_repository 'chef' do
    arch 'amd64'
    uri 'https://packages.chef.io/repos/apt/stable'
    key 'https://packages.chef.io/chef.asc'
    components ['main']
    action :add
  end

  apt_package 'chef-workstation' do
    # version '21.11.679'
    action :upgrade
  end

  apt_repository 'hashicorp' do
    arch 'amd64'
    uri 'https://apt.releases.hashicorp.com'
    key 'https://apt.releases.hashicorp.com/gpg'
    components ['main']
    action :add
  end

  gusztavvargadr_vagrant_app '' do
    version 'latest'
    action :install
  end

  apt_package 'packer' do
    # version '1.7.8'
    action :upgrade
  end

  gusztavvargadr_docker_engine '' do
    version '20.10.12'
    edition 'community'
    action [ :prepare, :install ]
  end

  apt_repository 'virtualbox' do
    arch 'amd64'
    uri 'https://download.virtualbox.org/virtualbox/debian'
    key 'https://www.virtualbox.org/download/oracle_vbox_2016.asc'
    components ['contrib']
    action :add
  end

  apt_package 'virtualbox-6.1' do
    action :upgrade
  end
end

action :install do
  return if new_resource.version.to_s.empty?

  agent_download_uri = "https://vstsagentpackage.azureedge.net/agent/#{new_resource.version}/vsts-agent-linux-x64-#{new_resource.version}.tar.gz"
  agent_local_path = "#{Chef::Config['file_cache_path']}/vsts-agent-linux-x64-#{new_resource.version}.tar.gz"

  remote_file agent_local_path do
    source agent_download_uri
    action :create
  end

  archive_file agent_local_path do
    destination "#{Chef::Config['file_cache_path']}/vsts-agent/"
    action :extract
  end
end

## azp user

# # Workstation
# choco install -y vscode

# # Vagrant
# ## TODO boxes

# # Packer
## Env vars
# ## TODO download ISOs

# ## TODO docker base images

# VBox extension

# [Environment]::SetEnvironmentVariable("VAGRANT_DEFAULT_PROVIDER", "virtualbox", "Machine")

# # AZP Agent
# # [Environment]::SetEnvironmentVariable("VSTS_AGENT_INPUT_URL", "https://dev.azure.com/gusztavvargadr/", "User")
# # [Environment]::SetEnvironmentVariable("VSTS_AGENT_INPUT_AUTH", "pat", "User")

# # [Environment]::SetEnvironmentVariable("AZP_AGENT_WINDOWS", "latest", "User")
# # [Environment]::SetEnvironmentVariable("AZP_AGENT_DOTNET", "latest", "User")
# # [Environment]::SetEnvironmentVariable("AZP_AGENT_CHEF", "latest", "User")
# # [Environment]::SetEnvironmentVariable("AZP_AGENT_VAGRANT", "latest", "User")
# # [Environment]::SetEnvironmentVariable("AZP_AGENT_PACKER", "latest", "User")
# # [Environment]::SetEnvironmentVariable("AZP_AGENT_DOCKER", "latest", "User")
# # [Environment]::SetEnvironmentVariable("AZP_AGENT_HYPERV", "latest", "User")

# ## TODO Configure agents
