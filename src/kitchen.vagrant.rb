directory = File.dirname(__FILE__)

require "#{directory}/vagrant"

VagrantDeployment.defaults_include(
  'environment' => 'kitchen.chef',

  'hostmanager' => false,

  'machines' => {
    'default' => {
    },
  }
)

VagrantMachine.defaults_include(
  'no_synced_folders' => true,
  'providers' => {
    'virtualbox' => {},
    'hyperv' => {},
  }
)

VagrantProvider.defaults_include(
  'memory' => 2048,
  'cpus' => 2
)

VagrantDeployment.configure(directory)
