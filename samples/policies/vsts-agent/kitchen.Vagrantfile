directory = File.dirname(__FILE__)

load "#{directory}/../../../src/kitchen.Vagrantfile"

Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |provider|
    provider.customize [ "modifyvm", :id, "--nested-hw-virt", "on" ]
  end

  config.vm.provider "hyperv" do |provider|
    provider.enable_virtualization_extensions = true
  end

  config.vm.provider "vmware_desktop" do |provider|
    provider.vmx["vhv.enable"] = "TRUE"
  end
end
