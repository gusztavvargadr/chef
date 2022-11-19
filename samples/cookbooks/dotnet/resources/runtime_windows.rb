unified_mode true

provides :gusztavvargadr_dotnet_runtime, platform: 'windows'

property :options, Hash, default: {}

default_action :install

action :install do
  runtime_type = new_resource.options['type']
  runtime_version = new_resource.options['version']
  return if runtime_type.to_s.empty? || runtime_version.to_s.empty?

  chocolatey_package_name =
    case runtime_type
    when 'dotnet'
      "dotnet-#{runtime_version}-runtime"
    when 'dotnetcore'
      "dotnetcore-#{runtime_version}-runtime"
    end

  chocolatey_package chocolatey_package_name do
    action :install
  end
end
