require "#{File.dirname(__FILE__)}/../../../src/Policyfile"

name 'gusztavvargadr_development'

gusztavvargadr_chef_sources

run_list(
  'recipe[gusztavvargadr_development::default]'
)

attributes(
  [
    "#{File.dirname(__FILE__)}/Policyfile.yml",
  ]
)
