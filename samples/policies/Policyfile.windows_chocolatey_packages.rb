directory = File.dirname(__FILE__)

require "#{directory}/../../src/Policyfile"

name 'windows_chocolatey_packages'

gusztavvargadr_chef_sources

cookbook 'gusztavvargadr_windows'

run_list 'recipe[gusztavvargadr_windows::chocolatey_packages]'

attributes "#{directory}/Policyfile.windows_chocolatey_packages.yml"
