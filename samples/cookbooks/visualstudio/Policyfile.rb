require "#{File.dirname(__FILE__)}/../../../src/Policyfile"

name 'gusztavvargadr_visualstudio'

gusztavvargadr_chef_sources

run_list(
  'recipe[gusztavvargadr_visualstudio::default]'
)
