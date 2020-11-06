directory = File.dirname(__FILE__)

require "#{directory}/vagrant"

VagrantDeployment.defaults_include(
  'machines' => {
    'default' => {
      'box' => 'gusztavvargadr/windows-server',
    },
  }
)

VagrantDeployment.configure(directory)
