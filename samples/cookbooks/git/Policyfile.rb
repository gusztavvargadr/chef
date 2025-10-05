require "#{File.dirname(__FILE__)}/../../../src/Policyfile"

name 'gusztavvargadr_git'

gusztavvargadr_chef_sources

run_list(
  'recipe[gusztavvargadr_git::default]'
)

attributes(
  [
    "#{File.dirname(__FILE__)}/Policyfile.yml",
  ]
)
