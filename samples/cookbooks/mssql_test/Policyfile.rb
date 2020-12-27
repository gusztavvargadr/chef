directory = File.dirname(__FILE__)

require "#{directory}/../../../src/Policyfile"

name 'gusztavvargadr_mssql_test'

gusztavvargadr_chef_sources

run_list(
  'recipe[gusztavvargadr_mssql_test::default]'
)

named_run_list(
  '2017_developer',
  'recipe[gusztavvargadr_mssql_test::2017_developer]'
)

named_run_list(
  '2019_developer',
  'recipe[gusztavvargadr_mssql_test::2019_developer]'
)

named_run_list(
  '2017_ssms',
  'recipe[gusztavvargadr_mssql_test::2017_ssms]'
)

named_run_list(
  '2018_ssms',
  'recipe[gusztavvargadr_mssql_test::2018_ssms]'
)
