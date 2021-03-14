gusztavvargadr_vagrant_boxes '' do
  options node['gusztavvargadr_vagrant']['boxes']
  action :add
  not_if { reboot_pending? }
end
