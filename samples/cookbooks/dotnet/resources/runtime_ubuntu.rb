unified_mode true

provides :gusztavvargadr_dotnet_runtime, platform: 'ubuntu'

property :options, Hash, default: {}

default_action :install

action :install do
  runtime_type = new_resource.options['type']
  runtime_version = new_resource.options['version']
  return if runtime_type.to_s.empty? || runtime_version.to_s.empty?

  gusztavvargadr_dotnet_packages '' do
    action :install
  end

  apt_package "dotnet-runtime-#{runtime_version}" do
    action :install
  end
end
