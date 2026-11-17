files = node['gusztavvargadr_hello_world']['files']
files.each do |file_name, file_options|
  gusztavvargadr_hello_world_file file_name do
    options file_options
    action :create
  end
end
