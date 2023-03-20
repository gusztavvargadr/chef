app = node['gusztavvargadr_git']['app']
app_options = node['gusztavvargadr_git']['app_options'][app]

gusztavvargadr_git_app '' do
  options app_options
  action :install
end
