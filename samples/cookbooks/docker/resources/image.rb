default_action :pull

action :pull do
  powershell_script "Pull Docker image '#{new_resource.name}'" do
    code <<-EOH
      docker pull #{new_resource.name}
    EOH
    action :run
  end
end
