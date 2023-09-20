unified_mode true

provides :gusztavvargadr_docker_image

default_action :pull

action :pull do
  execute "Pull Docker image '#{new_resource.name}'" do
    command "docker pull #{new_resource.name}"
    action :run
  end
end
