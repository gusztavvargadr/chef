directory = File.dirname(__FILE__)

require "#{directory}/vagrant"

VagrantMachine.defaults_include(
  'providers' => {
    'virtualbox' => {
      'memory' => 4096,
      'cpus' => 2,
    },
    'hyperv' => {
      'memory' => 4096,
      'cpus' => 2,
    },
    'azure' => {
      'size' => 'Standard_B2s',
    },
  },
  'synced_folders' => {
    '/vagrant' => {
      'disabled' => true,
    },
  },
)

VagrantDeployment.defaults_include(
  'service' => 'cookbooks',
  'stack' => 'chef',

  'machines' => {
    'default' => {},
  }
)

VagrantDeployment.configure(directory)
