directory = File.dirname(__FILE__)

require "#{directory}/../../../src/Policyfile"

name 'gusztavvargadr_hello_world'

gusztavvargadr_chef_sources

run_list(
  'recipe[gusztavvargar_hello_world::default]'
)
