app_options = node['gusztavvargadr_vagrant']['app_profiles'][node['gusztavvargadr_vagrant']['app']]

gusztavvargadr_vagrant_app '' do
  options app_options
  action :install
end
