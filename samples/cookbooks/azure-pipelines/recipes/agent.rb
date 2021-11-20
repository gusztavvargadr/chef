gusztavvargadr_azure_pipelines_agent '' do
  version node['gusztavvargadr_azure_pipelines']['agent']['version']
  action :install
end
