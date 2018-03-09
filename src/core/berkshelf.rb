def gusztavvargadr_sources
  source 'https://supermarket.chef.io'
end

def gusztavvargadr_chef_cookbook(component = '', namespace = '')
  cookbook_name = 'gusztavvargadr'
  cookbook_name = "#{cookbook_name}_#{component}" unless component.to_s.empty?
  cookbook_name = "#{cookbook_name}_#{namespace}" unless namespace.to_s.empty?

  path = component.to_s.empty? ? 'core' : component
  path = "#{path}/cookbooks/#{namespace.to_s.empty? ? 'core' : namespace}"
  cookbook_path = "#{File.dirname(__FILE__)}/../#{path}"

  cookbook cookbook_name, path: cookbook_path
end
