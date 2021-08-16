unified_mode true

property :options, Hash, required: true

default_action :install

action :install do
  new_resource.options.each do |plugin_name, plugin_options|
    gusztavvargadr_vagrant_plugin plugin_name do
      options plugin_options
      action :install
    end
  end
end
