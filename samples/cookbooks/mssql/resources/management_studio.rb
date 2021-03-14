property :version, String, default: ''

default_action :install

action :install do
  return if new_resource.version.to_s.empty?

  gusztavvargadr_windows_native_packages '' do
    options node['gusztavvargadr_mssql']['management_studio'][new_resource.version]['native_packages']
  end
end