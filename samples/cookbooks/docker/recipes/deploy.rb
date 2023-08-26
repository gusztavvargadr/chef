tools = node['gusztavvargadr_docker']['tools']
tools.each do |tool_name, tool_options|
  gusztavvargadr_docker_tool tool_name do
    options tool_options
    action :configure
    not_if { reboot_pending? }
  end
end

images = node['gusztavvargadr_docker']['images']
images.each do |image_name, _|
  gusztavvargadr_docker_image image_name do
    action :pull
    not_if { reboot_pending? }
  end
end
