property :name, String, name_property: true

default_action :pull

action :pull do
  image_list = powershell_out('docker image ls -a').stdout
  return if image_list.downcase.include?(new_resource.name.downcase)

  powershell_script "Pull Docker image '#{new_resource.name}'" do
    code <<-EOH
      docker pull #{new_resource.name}
    EOH
    action :run
  end
end
