unified_mode true

property :version, String, default: ''

default_action :install

action :install do
  return if new_resource.version.to_s.empty?

  options = node['gusztavvargadr_iis']['server'][new_resource.version]

  gusztavvargadr_windows_features '' do
    options options['features']
  end

  gusztavvargadr_windows_native_packages '' do
    options options['native_packages']
  end
end
