unified_mode true

default_action :pull

action :pull do
  execute "Pull Docker image '#{new_resource.name}'" do
    command "docker pull #{new_resource.name}"
    action :run
  end
end
