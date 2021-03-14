gusztavvargadr_visualstudio_ide '' do
  version node['gusztavvargadr_visualstudio']['ide']['version']
  edition node['gusztavvargadr_visualstudio']['ide']['edition']
  action [:prepare, :install]
end
