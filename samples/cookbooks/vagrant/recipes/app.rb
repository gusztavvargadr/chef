gusztavvargadr_vagrant_app '' do
  version node['gusztavvargadr_vagrant']['app']['version']
  action :install
  not_if { reboot_pending? }
end
