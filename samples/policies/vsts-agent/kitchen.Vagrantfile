directory = File.dirname(__FILE__)

load "#{directory}/../../../src/kitchen.Vagrantfile"

Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |config_provider|
    config_provider.customize [ "modifyvm", :id, "--nested-hw-virt", "on" ]
  end

  config.vm.provider "hyperv" do |config_provider|
    config_provider.enable_virtualization_extensions = true
  end
end
