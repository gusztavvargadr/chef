node['gusztavvargadr_vagrant']['boxes'].each do |box_name, box_options|
  gusztavvargadr_vagrant_box box_name do
    options box_options
    action :add
    not_if { reboot_pending? }
  end
end
