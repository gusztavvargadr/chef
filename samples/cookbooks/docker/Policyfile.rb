require "#{File.dirname(__FILE__)}/../../../src/Policyfile"

name 'gusztavvargadr_docker'

gusztavvargadr_chef_sources

run_list(
  'recipe[gusztavvargadr_docker::default]'
)

attributes(
  [
    "#{File.dirname(__FILE__)}/Policyfile.yml",
  ]
)
