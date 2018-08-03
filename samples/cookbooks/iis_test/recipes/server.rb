gusztavvargadr_windows_updates '' do
  action [:enable, :start]
end

include_recipe 'gusztavvargadr_iis::server'
