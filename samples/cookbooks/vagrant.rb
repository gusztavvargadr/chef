directory = File.dirname(__FILE__)

require "#{directory}/../../lib/gusztavvargadr/vagrant/samples/vagrant"

VagrantMachine.defaults_include(
  'providers' => {
    'virtualbox' => {
      'memory' => 2048,
      'cpus' => 2,
    },
    'hyperv' => {
      'memory' => 2048,
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
  }
)

VagrantDeployment.defaults_include(
  'stack' => 'chef',
  'service' => 'samples',
  'component' => 'cookbooks',

  'machines' => {
    'default' => VagrantWindowsServerMachine.defaults,
  }
)

VagrantDeployment.configure(directory)
