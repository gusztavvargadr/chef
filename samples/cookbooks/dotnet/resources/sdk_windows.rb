unified_mode true

provides :gusztavvargadr_dotnet_sdk, platform: 'windows'

property :options, Hash, default: {}

default_action :install

action :install do
  sdk_type = new_resource.options['type']
  sdk_version = new_resource.options['version']
  return if sdk_type.to_s.empty? || sdk_version.to_s.empty?

  chocolatey_package_name =
  case sdk_type
  when 'dotnet'
    "dotnet-#{sdk_version}-sdk"
  when 'dotnetcore'
    "dotnetcore-#{sdk_version}-sdk"
  end

  chocolatey_package chocolatey_package_name do
    action :install
  end
end
