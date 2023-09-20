updates = node['gusztavvargadr_ubuntu']['updates']
updates.each do |update_name, update_options|
  gusztavvargadr_ubuntu_update update_name do
    options update_options
    action :cleanup
  end
end
