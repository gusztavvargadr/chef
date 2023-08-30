unified_mode true

provides :gusztavvargadr_iis_tool, platform: 'windows'

property :options, Hash, default: {}

default_action :install

action :install do
  options = node['gusztavvargadr_iis']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  gusztavvargadr_windows_features '' do
    options options['features']
    action :install
  end

  gusztavvargadr_windows_native_packages '' do
    options options['native_packages']
    action :install
  end
end
