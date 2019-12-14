directory = File.dirname(__FILE__)

require "#{directory}/vagrant"

VagrantDeployment.defaults_include(
  'machines' => {
    'default' => VagrantWindowsServerMachine.defaults,
  }
)

VagrantDeployment.configure(directory)
