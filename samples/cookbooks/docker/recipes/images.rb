gusztavvargadr_docker_images '' do
  options node['gusztavvargadr_docker']['images']
  action :pull
end
