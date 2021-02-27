gusztavvargadr_mssql_management_studio '' do
  version node['gusztavvargadr_mssql']['management_studio']['version']
  action :install
  not_if { reboot_pending? }
end
