require 'yaml'
require 'erb'

def gusztavvargadr_chef_sources
  directory = File.dirname(__FILE__)

  default_source :supermarket
  default_source :chef_repo, "#{directory}/../samples/cookbooks"
end

def attributes(path)
  yml = YAML.load(ERB.new(File.read(path)).result)
  yml.each do |yml_name, yml_options|
    default[yml_name] = yml_options
  end
end
