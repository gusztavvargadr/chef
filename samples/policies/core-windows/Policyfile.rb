require "#{File.dirname(__FILE__)}/../../../src/Policyfile"

name 'gusztavvargadr_windows_core'

gusztavvargadr_chef_sources

run_list(
  'recipe[gusztavvargadr_windows::default]'
)

attributes(
  [
    "#{File.dirname(__FILE__)}/Policyfile.yml",
  ]
)
