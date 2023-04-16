node['gusztavvargadr_vsts']['apps'].each do |app|
  app_options = node['gusztavvargadr_vsts']['app_options'][app]

  next unless app == 'agent'

  gusztavvargadr_vsts_agent_app '' do
    options app_options
    action :prepare
  end
end
