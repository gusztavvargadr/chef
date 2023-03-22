node['gusztavvargadr_dotnet']['runtimes'].each do |runtime|
  runtime_options = node['gusztavvargadr_dotnet']['runtime_options'][runtime]

  gusztavvargadr_dotnet_runtime '' do
    options runtime_options
    action :install
  end
end

node['gusztavvargadr_dotnet']['sdks'].each do |sdk|
  sdk_options = node['gusztavvargadr_dotnet']['sdk_options'][sdk]

  gusztavvargadr_dotnet_sdk '' do
    options sdk_options
    action :install
  end
end
