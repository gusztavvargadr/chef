provider_cpus = 4
provider_memory = 8192
provider_linked_clone = true

Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |config_provider|
    config_provider.cpus = provider_cpus
    config_provider.memory = provider_memory
    config_provider.linked_clone = provider_linked_clone
  end

  config.vm.provider "hyperv" do |config_provider|
    config_provider.cpus = provider_cpus
    config_provider.memory = provider_memory
    config_provider.linked_clone = provider_linked_clone
  end
end
