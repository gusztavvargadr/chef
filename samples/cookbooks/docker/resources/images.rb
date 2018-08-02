property :images_options, Hash, required: true

default_action :pull

action :pull do
  new_resource.images_options.each do |image_name, image_options|
    gusztavvargadr_docker_image image_name do
      image_options image_options
      action :pull
    end
  end
end
