node['gusztavvargadr_hashicorp']['apps'].each do |app|
  app_options = node['gusztavvargadr_hashicorp']['app_options'][app]

  gusztavvargadr_hashicorp_app '' do
    options app_options
    action :install
  end
end
