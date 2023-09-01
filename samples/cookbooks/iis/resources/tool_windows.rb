unified_mode true

provides :gusztavvargadr_iis_tool, platform: 'windows'

property :options, Hash, default: {}

default_action :install

action :install do
  options = node['gusztavvargadr_iis']['options']['tools'][new_resource.name][node['platform']].merge(new_resource.options)

  features = options['features']
  features.each do |feature_name, _|
    windows_feature_dism feature_name do
      all true
      action :install
    end
  end

  native_packages = options['native_packages']
  native_packages.each do |native_package_name, native_package_options|
    gusztavvargadr_windows_native_package native_package_name do
      options native_package_options
      action :install
    end
  end
end
