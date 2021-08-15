unified_mode true

property :options, Hash, default: {}

default_action :pull

action :pull do
  return if new_resource.options.nil?

  new_resource.options.each do |name, _options|
    gusztavvargadr_docker_image name do
      action :pull
    end
  end
end
