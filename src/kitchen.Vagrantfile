Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |provider_virtualbox|
    provider_virtualbox.cpus = 4
    provider_virtualbox.memory = 8192
    provider_virtualbox.linked_clone = true
  end

  config.vm.provider "hyperv" do |provider_hyperv|
    provider_hyperv.cpus = 4
    provider_hyperv.memory = 8192
    provider_hyperv.linked_clone = true
  end
end
