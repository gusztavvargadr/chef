require "#{File.dirname(__FILE__)}/../../../src/Policyfile"

name 'gusztavvargadr_iis'

gusztavvargadr_chef_sources

run_list(
  'recipe[gusztavvargadr_iis::default]'
)

attributes(
  [
    "#{File.dirname(__FILE__)}/Policyfile.yml",
  ]
)
