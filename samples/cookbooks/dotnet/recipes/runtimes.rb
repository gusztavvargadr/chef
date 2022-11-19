node['gusztavvargadr_dotnet']['runtimes'].each do |runtime|
  runtime_options = node['gusztavvargadr_dotnet']['runtime_options'][runtime]

  gusztavvargadr_dotnet_runtime '' do
    options runtime_options
    action :install
  end
end
