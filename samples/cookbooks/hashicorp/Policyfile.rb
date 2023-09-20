require "#{File.dirname(__FILE__)}/../../../src/Policyfile"

name 'gusztavvargadr_hashicorp'

gusztavvargadr_chef_sources

run_list(
  'recipe[gusztavvargadr_hashicorp::default]'
)
