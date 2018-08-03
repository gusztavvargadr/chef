property :edition, String, name_property: true

action :install do
  gusztavvargadr_windows_native_packages '' do
    native_packages_options node['gusztavvargadr_visualstudio']["2017_#{new_resource.edition}"]['native_packages']
  end
end
