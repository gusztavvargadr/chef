directory = File.dirname(__FILE__)

require "#{directory}/vagrant"

VagrantDeployment.defaults_include(
  'machines' => {
    'default' => {
      'box' => 'gusztavvargadr/windows-10',
    },
  }
)

VagrantDeployment.configure(directory)
