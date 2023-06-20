provider_cpus = 4
provider_memory = 8192
provider_linked_clone = true

Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |provider|
    provider.cpus = provider_cpus
    provider.memory = provider_memory
    provider.linked_clone = provider_linked_clone
  end

  config.vm.provider "hyperv" do |provider|
    provider.cpus = provider_cpus
    provider.memory = provider_memory
    provider.linked_clone = provider_linked_clone
  end

  config.vm.provider "vmware_desktop" do |provider|
    provider.cpus = provider_cpus
    provider.memory = provider_memory
    provider.linked_clone = provider_linked_clone
  end
end
