property :edition, String, name_property: true

action :install do
  gusztavvargadr_windows_native_packages '' do
    options node['gusztavvargadr_visualstudio']["2019_#{new_resource.edition}"]['native_packages']
  end
end
