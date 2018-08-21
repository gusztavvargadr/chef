directory = File.dirname(__FILE__)

require "#{directory}/../../../src/Policyfile"

name 'dk'

gusztavvargadr_chef_sources

cookbook 'gusztavvargadr_windows'

run_list 'recipe[gusztavvargadr_windows::chocolatey_packages]'

attributes "#{directory}/Policyfile.dk.yml"
