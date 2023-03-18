unified_mode true

provides :gusztavvargadr_dotnet_sdk, platform: 'windows'

property :options, Hash, default: {}

default_action :install

action :install do
  sdk_version = new_resource.options['version']
  return if sdk_version.to_s.empty?

  chocolatey_package "dotnet-#{sdk_version}-sdk" do
    action :install
  end
end
