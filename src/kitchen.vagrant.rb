directory = File.dirname(__FILE__)

require "#{directory}/vagrant"

VagrantDeployment.defaults_include(
  'component' => 'suite',
  'service' => 'kitchen',
  'stack' => 'chef',

  'hostmanager' => false,

  'machines' => {
    'default' => {
    },
  }
)

VagrantMachine.defaults_include(
  'synced_folders' => {
    '/vagrant' => {
      'disabled' => true,
    },
  },
  'providers' => {
    'virtualbox' => {
      'memory' => 4096,
      'cpus' => 2,
    },
    'hyperv' => {
      'memory' => 4096,
      'cpus' => 2,
    },
  },
)

VagrantDeployment.configure(directory)
