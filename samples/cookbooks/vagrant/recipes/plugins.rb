node['gusztavvargadr_vagrant']['plugins'].each do |plugin_name, plugin_options|
  gusztavvargadr_vagrant_plugin plugin_name do
    options plugin_options
    action :install
    not_if { reboot_pending? }
  end
end
