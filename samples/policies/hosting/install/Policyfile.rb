directory = File.dirname(__FILE__)

require "#{directory}/../../../../src/Policyfile"

name 'gusztavvargadr_hosting_install'

gusztavvargadr_chef_sources

run_list(
  'recipe[gusztavvargadr_windows::chocolatey_packages]'
)

attributes(
  [
    "#{directory}/Policyfile.yml",
  ]
)
