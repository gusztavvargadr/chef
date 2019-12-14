directory = File.dirname(__FILE__)

require "#{directory}/../../../../src/Policyfile"

name 'gusztavvargadr_hosting_configure'

gusztavvargadr_chef_sources

run_list(
  'recipe[gusztavvargadr_docker::images]'
)

attributes(
  [
    "#{directory}/Policyfile.yml",
  ]
)
