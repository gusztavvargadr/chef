gusztavvargadr_windows_native_packages '' do
  options node['gusztavvargadr_windows']['native_packages'] || {}
  action :install
end
