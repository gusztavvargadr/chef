def gusztavvargadr_chef_sources
  source 'https://supermarket.chef.io'
end

def gusztavvargadr_chef_cookbook(name)
  directory = File.dirname(__FILE__)
  cookbook_name = "gusztavvargadr_#{name}"
  cookbook_path = "#{directory}/../samples/cookbooks/#{name}"

  cookbook cookbook_name, path: cookbook_path
end
