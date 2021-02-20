gusztavvargadr_vagrant_plugins '' do
  options node['gusztavvargadr_vagrant']['plugins']
  action :install
  not_if { reboot_pending? }
end
