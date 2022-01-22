gusztavvargadr_windows_updates '' do
  action node['gusztavvargadr_windows']['updates']['actions']
  not_if { reboot_pending? }
end
