node['gusztavvargadr_dotnet']['sdks'].each do |sdk|
  sdk_options = node['gusztavvargadr_dotnet']['sdk_options'][sdk]

  gusztavvargadr_dotnet_sdk '' do
    options sdk_options
    action :install
  end
end
