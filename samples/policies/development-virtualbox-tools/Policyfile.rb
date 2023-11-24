require "#{File.dirname(__FILE__)}/../../../src/Policyfile"

name 'gusztavvargadr_development_virtualbox_tools'

gusztavvargadr_chef_sources

run_list(
  'recipe[gusztavvargadr_virtualbox::default]',
)
