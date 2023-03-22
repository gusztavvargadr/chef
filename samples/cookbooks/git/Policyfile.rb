directory = File.dirname(__FILE__)

require "#{directory}/../../../src/Policyfile"

name 'gusztavvargadr_git'

gusztavvargadr_chef_sources

run_list(
  'recipe[gusztavvargadr_git::default]'
)
