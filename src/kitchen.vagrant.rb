directory = File.dirname(__FILE__)

require "#{directory}/vagrant"

VagrantMachine.defaults(
  'providers' => {
    'virtualbox' => {},
    'hyperv' => {},
  },
  'no_synced_folders' => true
)

VagrantProvider.defaults(
  'memory' => 2048,
  'cpus' => 2
)

deployment = VagrantDeployment.new(
  directory,
  'environment' => 'kitchen.chef',
  'tenant' => 'local',
  'hostmanager' => false,
  'machines' => {
    'default' => {
    },
  }
)
deployment.configure
