property :version, String, default: ''
property :edition, String, default: ''

default_action :install

action :prepare do
  return if new_resource.version.to_s.empty?
  return if new_resource.edition.to_s.empty?

  gusztavvargadr_windows_features '' do
    options node['gusztavvargadr_visualstudio']['ide']["#{new_resource.version}_default"]['features']
  end

  gusztavvargadr_windows_native_packages '' do
    options node['gusztavvargadr_visualstudio']['ide']["#{new_resource.version}_default"]['native_packages']
  end
end

action :install do
  return if new_resource.version.to_s.empty?
  return if new_resource.edition.to_s.empty?

  gusztavvargadr_windows_native_packages '' do
    options node['gusztavvargadr_visualstudio']['ide']["#{new_resource.version}_#{new_resource.edition}"]['native_packages']
  end
end
