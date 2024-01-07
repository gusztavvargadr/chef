unified_mode true

provides :gusztavvargadr_visualstudio_tool, platform: 'windows'

property :options, Hash, default: {}

default_action :install

action :initialize do
  options = node['gusztavvargadr_visualstudio']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  features = options['features']
  features.each do |feature_name, _|
    windows_feature_dism feature_name do
      all true
      action :install
    end
  end
end

action :install do
  options = node['gusztavvargadr_visualstudio']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  native_packages = options['native_packages']
  native_packages.each do |native_package_name, native_package_options|
    gusztavvargadr_windows_native_package native_package_name do
      options native_package_options
      action :install
    end
  end
end
