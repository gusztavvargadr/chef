node['gusztavvargadr_chef']['apps'].each do |app|
  app_options = node['gusztavvargadr_chef']['app_options'][app]

  gusztavvargadr_chef_app '' do
    options app_options
    action :install
  end
end
