directory = File.dirname(__FILE__)

load "#{directory}/../../../src/kitchen.Vagrantfile"

Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |provider_virtualbox|
    provider_virtualbox.customize [ "modifyvm", :id, "--nested-hw-virt", "on" ]
  end

  config.vm.provider "hyperv" do |provider_hyperv|
    provider_hyperv.enable_virtualization_extensions = true
  end
end
