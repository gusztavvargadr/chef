directory = File.dirname(__FILE__)

require "#{directory}/../../../src/Policyfile"

name 'gusztavvargadr_dotnet'

gusztavvargadr_chef_sources

run_list(
  'recipe[gusztavvargadr_dotnet::default]'
)
