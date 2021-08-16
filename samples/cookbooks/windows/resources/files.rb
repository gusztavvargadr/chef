unified_mode true

property :options, Hash, default: {}

default_action :create

action :create do
  return if new_resource.options.nil?

  new_resource.options.each do |name, options|
    gusztavvargadr_windows_file name do
      options options
      action :create
    end
  end
end
