node['gusztavvargadr_vsts']['apps'].each do |app|
  app_options = node['gusztavvargadr_vsts']['app_options'][app]

  next unless app_options['name'] == 'vsts-agent'

  gusztavvargadr_vsts_agent_app '' do
    options app_options
    action :add
    not_if { reboot_pending? }
  end
end
