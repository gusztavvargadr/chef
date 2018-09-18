directory = File.dirname(__FILE__)

require "#{directory}/../../../src/Policyfile"

name 'install_chef'

gusztavvargadr_chef_sources

run_list(
  'recipe[gusztavvargadr_windows::chocolatey_packages]'
)

attributes(
  [
    "#{directory}/../Policyfile.install_workstation.yml",
    "#{directory}/../Policyfile.install_chefdk.yml",
  ]
)
