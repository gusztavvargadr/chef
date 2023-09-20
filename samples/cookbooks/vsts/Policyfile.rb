require "#{File.dirname(__FILE__)}/../../../src/Policyfile"

name 'gusztavvargadr_vsts'

gusztavvargadr_chef_sources

run_list(
  'recipe[gusztavvargadr_vsts::default]'
)

named_run_list(
  :destroy,
  'recipe[gusztavvargadr_vsts::destroy]'
)
