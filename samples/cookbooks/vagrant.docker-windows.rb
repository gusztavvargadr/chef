directory = File.dirname(__FILE__)

require "#{directory}/vagrant"

VagrantDeployment.defaults_include(
  'machines' => {
    'default' => VagrantDockerWindowsMachine.defaults,
  }
)

VagrantDeployment.configure(directory)
