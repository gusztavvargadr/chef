unified_mode true

provides :gusztavvargadr_dotnet_runtime, platform: 'windows'

property :options, Hash, default: {}

default_action :install

action :install do
  runtime_version = new_resource.options['version']
  return if runtime_version.to_s.empty?

  chocolatey_package "dotnet-#{runtime_version}-runtime" do
    action :install
  end
end
