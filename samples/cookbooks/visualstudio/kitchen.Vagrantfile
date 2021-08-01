Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |v|
    v.linked_clone = true
  end

  config.vm.provider "hyperv" do |h|
    h.linked_clone = true
    h.enable_virtualization_extensions = true
  end
end
