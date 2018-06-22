require "#{File.dirname(__FILE__)}/../lib/gusztavvargadr/vagrant/src/vagrant"

VagrantMachine.defaults(
  'providers' => {
    'virtualbox' => {},
    'hyperv' => {},
  },
  'no_synced_folders' => true
)

VagrantProvider.defaults(
  'memory' => 4096,
  'cpus' => 2
)

deployment = VagrantDeployment.new(
  File.dirname(__FILE__),
  'environment' => 'chef',
  'hostmanager' => false,
  'machines' => {
    'kitchen' => {
    },
  }
)
deployment.configure
