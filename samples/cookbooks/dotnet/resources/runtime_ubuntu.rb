unified_mode true

provides :gusztavvargadr_dotnet_runtime, platform: 'ubuntu'

property :options, Hash, default: {}

default_action :install

action :install do
  runtime_version = new_resource.options['version']
  return if runtime_version.to_s.empty?

  gusztavvargadr_dotnet_repository '' do
    action :add
  end

  apt_package "dotnet-runtime-#{runtime_version}" do
    action :install
  end
end
