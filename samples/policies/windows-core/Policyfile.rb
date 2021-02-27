directory = File.dirname(__FILE__)

require "#{directory}/../../../src/Policyfile"

name 'gusztavvargadr_windows_core'

gusztavvargadr_chef_sources

run_list(
  'recipe[gusztavvargadr_windows::default]'
)

attributes(
  [
    "#{directory}/Policyfile.yml",
  ]
)
