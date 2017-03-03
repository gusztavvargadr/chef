source 'https://supermarket.chef.io'

def gusztavvargadr_cookbook(name)
  cookbook "gusztavvargadr_#{name}", path: "../gusztavvargadr_#{name}"
end
