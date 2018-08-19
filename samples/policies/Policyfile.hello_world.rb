directory = File.dirname(__FILE__)

require "#{directory}/../../src/Policyfile"

name 'hello_world'

gusztavvargadr_chef_sources

cookbook 'hello_world'

run_list 'recipe[hello_world::default]'
