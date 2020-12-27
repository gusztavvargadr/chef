directory = File.dirname(__FILE__)

require "#{directory}/../../../src/Policyfile"

name 'gusztavvargadr_visualstudio_test'

gusztavvargadr_chef_sources

run_list(
  'recipe[gusztavvargadr_visualstudio_test::default]'
)

named_run_list(
  '2017_community',
  'recipe[gusztavvargadr_visualstudio_test::2017_community]'
)

named_run_list(
  '2017_professional',
  'recipe[gusztavvargadr_visualstudio_test::2017_professional]'
)

named_run_list(
  '2019_community',
  'recipe[gusztavvargadr_visualstudio_test::2019_community]'
)

named_run_list(
  '2019_professional',
  'recipe[gusztavvargadr_visualstudio_test::2019_professional]'
)
