app = node['gusztavvargadr_vagrant']['app']
app_options = node['gusztavvargadr_vagrant']['app_options'][app]

gusztavvargadr_vagrant_app '' do
  options app_options
  action :install
end
