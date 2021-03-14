directory = File.dirname(__FILE__)

require "#{directory}/../../../src/Policyfile"

name 'gusztavvargadr_windows'

gusztavvargadr_chef_sources

run_list(
  'recipe[gusztavvargadr_windows::default]'
)
