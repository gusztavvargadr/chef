require 'yaml'
require 'erb'

def gusztavvargadr_chef_sources
  directory = File.dirname(__FILE__)

  default_source :supermarket
  default_source :chef_repo, "#{directory}/../samples/cookbooks"
end

def attributes(paths)
  yml = {}
  paths.each do |path|
    yml = yml.deep_merge(YAML.load(ERB.new(File.read(path)).result))
  end

  yml.each do |yml_name, yml_options|
    default[yml_name] = yml_options
  end
end

class ::Hash
  def deep_merge(other)
    merger = proc { |key, v1, v2| Hash === v1 && Hash === v2 ? v1.merge(v2, &merger) : Array === v1 && Array === v2 ? v1 | v2 : [:undefined, nil, :nil].include?(v2) ? v1 : v2 }
    self.merge(other.to_h, &merger)
  end
end
