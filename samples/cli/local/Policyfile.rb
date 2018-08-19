directory = File.dirname(__FILE__)

require "#{directory}/../../../src/Policyfile"

name 'cli'

gusztavvargadr_chef_sources

cookbook 'gusztavvargadr_windows'

run_list 'recipe[gusztavvargadr_windows::chocolatey_packages]'

attributes "#{directory}/Policyfile.yml"
