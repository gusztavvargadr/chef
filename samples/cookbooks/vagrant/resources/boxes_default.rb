provides :gusztavvargadr_vagrant_boxes

property :options, Hash, required: true

default_action :add

action :add do
  new_resource.options.each do |box_name, box_options|
    gusztavvargadr_vagrant_box box_name do
      options box_options
      action :add
    end
  end
end
