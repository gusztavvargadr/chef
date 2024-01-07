updates = node['gusztavvargadr_windows']['updates']
updates.each do |update_name, update_options|
  gusztavvargadr_windows_update update_name do
    options update_options
    action update_name.gsub('-', '_')
  end
end

native_packages = node['gusztavvargadr_windows']['native_packages']
native_packages.each do |native_package_name, native_package_options|
  gusztavvargadr_windows_native_package native_package_name do
    options native_package_options
    action :install
  end
end
