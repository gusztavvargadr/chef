node['gusztavvargadr_chef']['apps'].each do |app_name, _|
  app_options = node['gusztavvargadr_chef']['app_options'][app_name]

  gusztavvargadr_chef_app app_name do
    options app_options
    action :install
  end
end
