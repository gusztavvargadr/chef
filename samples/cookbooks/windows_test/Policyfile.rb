directory = File.dirname(__FILE__)

require "#{directory}/../../../src/Policyfile"

name 'gusztavvargadr_windows_test'

gusztavvargadr_chef_sources

run_list(
  'recipe[gusztavvargadr_windows_test::default]'
)

named_run_list(
  'chocolatey_packages',
  'recipe[gusztavvargadr_windows_test::chocolatey_packages]'
)

named_run_list(
  'environment_variables',
  'recipe[gusztavvargadr_windows_test::environment_variables]'
)

named_run_list(
  'features',
  'recipe[gusztavvargadr_windows_test::features]'
)

named_run_list(
  'files',
  'recipe[gusztavvargadr_windows_test::files]'
)

named_run_list(
  'native_packages',
  'recipe[gusztavvargadr_windows_test::native_packages]'
)

named_run_list(
  'updates',
  'recipe[gusztavvargadr_windows_test::updates]'
)
