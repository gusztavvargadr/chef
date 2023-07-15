images_options = node['gusztavvargadr_docker']['images']

images_options.each do |image_name, _image_options|
  gusztavvargadr_docker_image image_name do
    action :pull
    not_if { reboot_pending? }
  end
end
