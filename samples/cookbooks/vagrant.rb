directory = File.dirname(__FILE__)

require "#{directory}/../../lib/gusztavvargadr/vagrant/src/vagrant"
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
  },
  'synced_folders' => {
    '/vagrant' => {
      'disabled' => true,
    },
  }
)

VagrantDeployment.defaults_include(
  'stack' => 'chef-samples',
  'service' => 'cookbooks',
  'component' => 'kitchen',
  'machines' => {
    'default' => {},
  }
)

VagrantDeployment.configure(directory)
