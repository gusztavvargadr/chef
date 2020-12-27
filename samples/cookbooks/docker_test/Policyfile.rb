directory = File.dirname(__FILE__)

require "#{directory}/../../../src/Policyfile"

name 'gusztavvargadr_docker_test'

gusztavvargadr_chef_sources

run_list(
  'recipe[gusztavvargadr_docker_test::default]'
)

named_run_list(
  'engine_community',
  'recipe[gusztavvargadr_docker_test::engine_community]'
)

named_run_list(
  'engine_enterprise',
  'recipe[gusztavvargadr_docker_test::engine_enterprise]'
)

named_run_list(
  'images',
  'recipe[gusztavvargadr_docker_test::images]'
)
