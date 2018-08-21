property :image_name, String, name_property: true
property :image_options, Hash

default_action :pull

action :pull do
  image_platform = node['platform']

  case image_platform
  when 'windows'
    powershell_script "Pull Docker image '#{new_resource.image_name}'" do
      code <<-EOH
        docker pull #{new_resource.image_name}
      EOH
      action :run
    end
  when 'ubuntu'
    bash "Pull Docker image '#{new_resource.image_name}'" do
      code <<-EOH
        docker pull #{new_resource.image_name}
      EOH
      action :run
    end
  end
end
