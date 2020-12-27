directory = File.dirname(__FILE__)

require "#{directory}/../../../src/Policyfile"

name 'gusztavvargadr_vagrant_test'

gusztavvargadr_chef_sources

run_list(
  'recipe[gusztavvargadr_vagrant_test::default]'
)

named_run_list(
  'app',
  'recipe[gusztavvargadr_vagrant_test::app]'
)
