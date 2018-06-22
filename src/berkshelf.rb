def gusztavvargadr_chef_sources
  source 'https://supermarket.chef.io'
end

def gusztavvargadr_chef_cookbook(name = '')
  cookbook_name = "gusztavvargadr_#{name}"
  cookbook_path = "#{File.dirname(__FILE__)}/../samples/cookbooks/#{name}"

  cookbook cookbook_name, path: cookbook_path
end
