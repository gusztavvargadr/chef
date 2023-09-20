require "#{File.dirname(__FILE__)}/../../../src/Policyfile"

name 'gusztavvargadr_mssql'

gusztavvargadr_chef_sources

run_list(
  'recipe[gusztavvargadr_mssql::default]'
)
