node['gusztavvargadr_virtualbox']['apps'].each do |app|
  app_options = node['gusztavvargadr_virtualbox']['app_options'][app]

  gusztavvargadr_virtualbox_app '' do
    options app_options
    action :install
  end
end
