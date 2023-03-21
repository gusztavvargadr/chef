node['gusztavvargadr_vsts']['apps'].each do |app|
  app_options = node['gusztavvargadr_vsts']['app_options'][app]

  if app_options['name'] == 'vsts-agent'
    gusztavvargadr_vsts_agent_app '' do
      options app_options
      action :add
    end
  end
end
