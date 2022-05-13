Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |provider_virtualbox|
    provider_virtualboxcpus = 2
    provider_virtualbox.memory = 4096
  end

  config.vm.provider "hyperv" do |provider_hyperv|
    provider_hyperv.cpus = 2
    provider_hyperv.memory = 4096
  end
end
