gusztavvargadr_windows_chocolatey_packages '' do
  options node['gusztavvargadr_windows']['chocolatey_packages'] || {}
  action :install
end
