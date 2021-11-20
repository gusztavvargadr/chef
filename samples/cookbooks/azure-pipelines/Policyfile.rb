directory = File.dirname(__FILE__)

require "#{directory}/../../../src/Policyfile"

name 'gusztavvargadr_azure_pipelines'

gusztavvargadr_chef_sources

run_list(
  'recipe[gusztavvargadr_azure_pipelines::default]'
)
