property :version, String, default: ''

default_action :install

action :install do
  return if new_resource.version.to_s.empty?

  options = node['gusztavvargadr_mssql']['management_studio'][new_resource.version]

  gusztavvargadr_windows_native_packages '' do
    options options['native_packages']
  end
end
