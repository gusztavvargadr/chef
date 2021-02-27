gusztavvargadr_iis_server '' do
  version node['gusztavvargadr_iis']['server']['version']
  action :install
  not_if { reboot_pending? }
end
