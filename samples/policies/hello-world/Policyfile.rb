directory = File.dirname(__FILE__)

require "#{directory}/../../../src/Policyfile"

name 'gusztavvargadr_hello_world'

gusztavvargadr_chef_sources

run_list(
  'recipe[hello_world::default]'
)
