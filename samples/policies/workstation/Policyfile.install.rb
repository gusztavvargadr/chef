directory = File.dirname(__FILE__)

require "#{directory}/../../Policyfile"

name 'workstation_install'

gusztavvargadr_chef_sources

run_list(
  'recipe[gusztavvargadr_windows::chocolatey_packages]'
)

attributes(
  [
    "#{directory}/Policyfile.install.yml",
  ]
)
