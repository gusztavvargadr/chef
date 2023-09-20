require "#{File.dirname(__FILE__)}/../../../src/Policyfile"

name 'gusztavvargadr_ubuntu'

gusztavvargadr_chef_sources

run_list(
  'recipe[gusztavvargadr_ubuntu::default]'
)
