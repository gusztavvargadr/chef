provider_cpus = ENV["VAGRANT_PROVIDER_CPUS"] || "4"
provider_memory = ENV["VAGRANT_PROVIDER_MEMORY"] || "8192"
provider_linked_clone = ENV["VAGRANT_PROVIDER_LINKED_CLONE"] || true
provider_nested_virtualization = ENV["VAGRANT_PROVIDER_NESTED_VIRTUALIZATION"] || false

hyperv_network_bridge = ENV["VAGRANT_HYPERV_NETWORK_BRIDGE"] || "Default Switch"

Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |provider, _override|
    provider.cpus = provider_cpus
    provider.memory = provider_memory
    provider.linked_clone = provider_linked_clone
    provider.customize [ "modifyvm", :id, "--nested-hw-virt", "on" ] if provider_nested_virtualization
  end

  config.vm.provider "vmware_desktop" do |provider, _override|
    provider.cpus = provider_cpus
    provider.memory = provider_memory
    provider.linked_clone = provider_linked_clone
    provider.vmx["vhv.enable"] = "TRUE" if provider_nested_virtualization
  end

  config.vm.provider "hyperv" do |provider, override|
    provider.cpus = provider_cpus
    provider.memory = provider_memory
    provider.linked_clone = provider_linked_clone
    provider.enable_virtualization_extensions = true if provider_nested_virtualization

    override.vm.network "private_network", bridge: hyperv_network_bridge
  end
end
