require "#{File.dirname(__FILE__)}/../../../src/Policyfile"

name 'gusztavvargadr_chef_workstation'

gusztavvargadr_chef_sources

run_list(
  'recipe[gusztavvargadr_chef::default]',
)

attributes(
  [
    "#{File.dirname(__FILE__)}/Policyfile.yml",
  ]
)
