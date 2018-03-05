require "#{File.dirname(__FILE__)}/../../lib/gusztavvargadr/vagrant/src/vagrant"

#     HyperVProvider.new(vm) do |provider|
#       provider.override.vm.synced_folder '.', '/vagrant', disabled: true
#     end

VagrantMachine.defaults('providers' =>
{
  'virtualbox' => {},
  'hyperv' => {},
})
VagrantProvider.defaults('memory' => 4096, 'cpus' => 2)

deployment = VagrantDeployment.new(File.dirname(__FILE__), 'environment' => 'kitchen.chef', 'machines' =>
{
  'default' => {
  },
})
deployment.configure
