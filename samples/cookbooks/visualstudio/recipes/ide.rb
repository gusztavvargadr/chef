gusztavvargadr_visualstudio_ide '' do
  version node['gusztavvargadr_visualstudio']['ide']['version']
  edition node['gusztavvargadr_visualstudio']['ide']['edition']
  action [:prepare, :install]
  not_if { reboot_pending? }
end
