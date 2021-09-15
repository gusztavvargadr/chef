Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |v|
    v.cpus = 2
    v.memory = 4096
  end

  config.vm.provider "hyperv" do |h|
    h.cpus = 2
    h.memory = 4096
    h.enable_virtualization_extensions = true
  end
end
