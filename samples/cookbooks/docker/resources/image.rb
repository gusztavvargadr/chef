property :name, String, name_property: true

default_action :pull

action :pull do
  platform = node['platform']

  case platform
  when 'windows'
    powershell_script "Pull Docker image '#{new_resource.name}'" do
      code <<-EOH
        docker pull #{new_resource.name}
      EOH
      action :run
    end
  when 'ubuntu'
    bash "Pull Docker image '#{new_resource.name}'" do
      code <<-EOH
        docker pull #{new_resource.name}
      EOH
      action :run
    end
  end
end
