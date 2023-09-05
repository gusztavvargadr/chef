require "#{File.dirname(__FILE__)}/../../../src/Policyfile"

name 'gusztavvargadr_development_core_tools'

gusztavvargadr_chef_sources

run_list(
  'recipe[gusztavvargadr_git::default]',
  'recipe[gusztavvargadr_dotnet::default]',
  'recipe[gusztavvargadr_hashicorp::default]',
  'recipe[gusztavvargadr_chef::default]',
  'recipe[gusztavvargadr_docker::default]',
)

attributes(
  [
    "#{File.dirname(__FILE__)}/Policyfile.yml",
  ]
)
