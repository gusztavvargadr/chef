directory = File.dirname(__FILE__)

require "#{directory}/../../../src/Policyfile"

name 'gusztavvargadr_iis_test'

gusztavvargadr_chef_sources

run_list(
  'recipe[gusztavvargadr_iis_test::default]'
)

named_run_list(
  'server',
  'recipe[gusztavvargadr_iis_test::server]'
)
