directory = File.dirname(__FILE__)

require "#{directory}/../../../src/Policyfile"

name 'gusztavvargadr_vsts_agent'

gusztavvargadr_chef_sources

run_list(
  'recipe[gusztavvargadr_vsts::prepare]',
  'recipe[gusztavvargadr_vsts::add]',
)

named_run_list(
  :remove,
  'recipe[gusztavvargadr_vsts::remove]',
)

attributes(
  [
    "#{directory}/Policyfile.yml",
  ]
)
