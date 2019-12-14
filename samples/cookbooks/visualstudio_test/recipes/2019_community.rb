gusztavvargadr_windows_updates '' do
  action [:enable, :start]
end

include_recipe 'gusztavvargadr_visualstudio::2019_requirements'
include_recipe 'gusztavvargadr_visualstudio::2019_community'
