require "#{File.dirname(__FILE__)}/../../../src/Policyfile"

name 'gusztavvargadr_hello_world'

gusztavvargadr_chef_sources

run_list(
  'recipe[gusztavvargadr_hello_world::default]'
)

attributes(
  [
    "#{File.dirname(__FILE__)}/Policyfile.yml",
  ]
)
