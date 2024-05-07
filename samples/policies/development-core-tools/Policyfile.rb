require "#{File.dirname(__FILE__)}/../../../src/Policyfile"

name 'gusztavvargadr_development_core_tools'

gusztavvargadr_chef_sources

run_list(
  'recipe[gusztavvargadr_git::initialize]',
  'recipe[gusztavvargadr_dotnet::initialize]',
  'recipe[gusztavvargadr_hashicorp::initialize]',
  'recipe[gusztavvargadr_docker::initialize]',

  'recipe[gusztavvargadr_git::apply]',
  'recipe[gusztavvargadr_dotnet::apply]',
  'recipe[gusztavvargadr_hashicorp::apply]',
  'recipe[gusztavvargadr_docker::apply]',

  'recipe[gusztavvargadr_git::cleanup]',
  'recipe[gusztavvargadr_dotnet::cleanup]',
  'recipe[gusztavvargadr_hashicorp::cleanup]',
  'recipe[gusztavvargadr_docker::cleanup]',
)

attributes(
  [
    "#{File.dirname(__FILE__)}/Policyfile.yml",
  ]
)
