gusztavvargadr_windows_updates '' do
  action [:enable, :start, :configure]
end

include_recipe 'gusztavvargadr_mssql::2019_developer'
