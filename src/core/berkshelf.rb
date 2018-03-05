def gusztavvargadr_sources
  source 'https://supermarket.chef.io'
end

def gusztavvargadr_cookbook(component, namespace = '', path = '')
  cookbook_name = "gusztavvargadr_#{component}"
  cookbook_name = "#{cookbook_name}_#{namespace}" unless namespace.to_s.empty?

  if path.to_s.empty?
    path = namespace.to_s.empty? ? 'core' : namespace
  end
  cookbook_path = "#{File.dirname(__FILE__)}/../#{component}/#{path}"

  cookbook cookbook_name, path: cookbook_path
end
