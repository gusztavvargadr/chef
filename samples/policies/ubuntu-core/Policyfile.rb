require "#{File.dirname(__FILE__)}/../../../src/Policyfile"

name 'gusztavvargadr_ubuntu_core'

gusztavvargadr_chef_sources

run_list(
  'recipe[gusztavvargadr_ubuntu::default]'
)

attributes(
  [
    "#{File.dirname(__FILE__)}/Policyfile.yml",
  ]
)
