directory = File.dirname(__FILE__)

require "#{directory}/../lib/gusztavvargadr/vagrant/samples/vagrant"

VagrantDeployment.defaults_include(
  'stack' => 'chef'
)
