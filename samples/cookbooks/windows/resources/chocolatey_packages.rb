property :options, Hash, required: true

default_action :install

action :install do
  return if new_resource.options.nil?

  new_resource.options.each do |name, options|
    gusztavvargadr_windows_chocolatey_package name do
      options options
      action :install
    end
  end
end
