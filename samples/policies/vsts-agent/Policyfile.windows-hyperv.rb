directory = File.dirname(__FILE__)

require "#{directory}/../../../src/Policyfile"

name 'gusztavvargadr_vsts_agent_windows_hyperv'

gusztavvargadr_chef_sources

run_list(
  'recipe[gusztavvargadr_vsts::prepare]',
  'recipe[gusztavvargadr_git::default]',
  'recipe[gusztavvargadr_dotnet::default]',
  'recipe[gusztavvargadr_hashicorp::default]',
  'recipe[gusztavvargadr_chef::default]',
  'recipe[gusztavvargadr_docker::default]',
  'recipe[gusztavvargadr_vsts::add]',
)

named_run_list(
  :remove,
  'recipe[gusztavvargadr_vsts::remove]',
)

attributes(
  [
    "#{directory}/Policyfile.windows-hyperv.yml",
  ]
)
