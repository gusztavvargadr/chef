require "#{File.dirname(__FILE__)}/../../../src/Policyfile"

name 'gusztavvargadr_vagrant'

gusztavvargadr_chef_sources

run_list(
  'recipe[gusztavvargadr_vagrant::default]'
)
