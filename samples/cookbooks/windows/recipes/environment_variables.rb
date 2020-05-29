gusztavvargadr_windows_environment_variables '' do
  options node['gusztavvargadr_windows']['environment_variables'] || {}
  action :create
end
