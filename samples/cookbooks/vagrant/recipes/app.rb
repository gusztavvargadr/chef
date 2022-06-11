gusztavvargadr_vagrant_app '' do
  options node['gusztavvargadr_vagrant']['app_profiles'][node['gusztavvargadr_vagrant']['app']]
  action :install
end
