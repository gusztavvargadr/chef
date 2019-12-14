property :options, Hash, required: true

default_action :install

action :install do
  return if new_resource.options.nil?

  gusztavvargadr_windows_features '' do
    options new_resource.options['features']
  end

  gusztavvargadr_windows_native_packages '' do
    options new_resource.options['native_packages']
  end
end
