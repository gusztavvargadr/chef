app = node['gusztavvargadr_vagrant']['app']
app_options = node['gusztavvargadr_hashicorp']['app_options']['vagrant']

gusztavvargadr_hashicorp_app '' do
  options app_options
  action :install
end
