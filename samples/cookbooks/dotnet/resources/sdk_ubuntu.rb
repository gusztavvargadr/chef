unified_mode true

provides :gusztavvargadr_dotnet_sdk, platform: 'ubuntu'

property :options, Hash, default: {}

default_action :install

action :install do
  sdk_type = new_resource.options['type']
  sdk_version = new_resource.options['version']
  return if sdk_type.to_s.empty? || sdk_version.to_s.empty?

  gusztavvargadr_dotnet_repository '' do
    action :add
  end

  apt_package "dotnet-sdk-#{sdk_version}" do
    action :install
  end
end
