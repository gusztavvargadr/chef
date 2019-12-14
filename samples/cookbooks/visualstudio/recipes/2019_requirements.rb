gusztavvargadr_windows_features '' do
  options node['gusztavvargadr_visualstudio']['2019_requirements']['features']
end

gusztavvargadr_windows_native_packages '' do
  options node['gusztavvargadr_visualstudio']['2019_requirements']['native_packages']
end
