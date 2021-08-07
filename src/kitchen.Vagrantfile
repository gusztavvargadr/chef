Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |v|
    v.cpus = 2
    v.memory = 4096
    v.linked_clone = true
  end

  config.vm.provider "hyperv" do |h|
    h.cpus = 2
    h.memory = 4096
    h.linked_clone = true
    h.enable_virtualization_extensions = true
  end
end