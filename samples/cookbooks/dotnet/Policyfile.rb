require "#{File.dirname(__FILE__)}/../../../src/Policyfile"

name 'gusztavvargadr_dotnet'

gusztavvargadr_chef_sources

run_list(
  'recipe[gusztavvargadr_dotnet::default]'
)
