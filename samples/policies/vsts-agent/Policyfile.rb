require "#{File.dirname(__FILE__)}/../../../src/Policyfile"

name 'gusztavvargadr_vsts_agent'

gusztavvargadr_chef_sources

run_list(
  'recipe[gusztavvargadr_vsts::initialize]',
  'recipe[gusztavvargadr_vsts::provision]',
  'recipe[gusztavvargadr_vsts::deploy]',
  'recipe[gusztavvargadr_vsts::cleanup]',
)

attributes(
  [
    "#{File.dirname(__FILE__)}/Policyfile.yml",
  ]
)
