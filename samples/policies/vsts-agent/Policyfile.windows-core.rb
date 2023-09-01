require "#{File.dirname(__FILE__)}/../../../src/Policyfile"

name 'gusztavvargadr_vsts_agent_windows_core'

gusztavvargadr_chef_sources

run_list(
  'recipe[gusztavvargadr_windows::default]',
  'recipe[gusztavvargadr_vsts::initialize]',
  'recipe[gusztavvargadr_git::default]',
  'recipe[gusztavvargadr_dotnet::default]',
  'recipe[gusztavvargadr_hashicorp::default]',
  'recipe[gusztavvargadr_chef::default]',
  'recipe[gusztavvargadr_docker::default]',
  'recipe[gusztavvargadr_vsts::provision]',
  'recipe[gusztavvargadr_vsts::deploy]',
  'recipe[gusztavvargadr_vsts::cleanup]',
)

attributes(
  [
    "#{File.dirname(__FILE__)}/Policyfile.windows-core.yml",
  ]
)
