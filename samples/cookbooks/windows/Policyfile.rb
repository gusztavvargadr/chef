require "#{File.dirname(__FILE__)}/../../../src/Policyfile"

name 'gusztavvargadr_windows'

gusztavvargadr_chef_sources

run_list(
  'recipe[gusztavvargadr_windows::default]'
)
