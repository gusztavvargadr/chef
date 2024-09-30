require "#{File.dirname(__FILE__)}/../../../src/Policyfile"

name 'gusztavvargadr_virtualbox_6_1'

gusztavvargadr_chef_sources

run_list(
  'recipe[gusztavvargadr_virtualbox::default]'
)

attributes(
  [
    "#{File.dirname(__FILE__)}/Policyfile.6-1.yml",
  ]
)
