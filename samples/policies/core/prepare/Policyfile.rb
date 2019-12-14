directory = File.dirname(__FILE__)

require "#{directory}/../../../../src/Policyfile"

name 'gusztavvargadr_core_prepare'

gusztavvargadr_chef_sources

run_list(
  'recipe[gusztavvargadr_docker::engine_enterprise]'
)

attributes(
  [
    "#{directory}/Policyfile.yml",
  ]
)
