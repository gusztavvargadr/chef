property :environment_variables_options, Hash, required: true

default_action :create

action :create do
  new_resource.environment_variables_options.each do |environment_variable_name, environment_variable_options|
    gusztavvargadr_windows_environment_variable environment_variable_name do
      environment_variable_options environment_variable_options || {}
      action :create
    end
  end
end
