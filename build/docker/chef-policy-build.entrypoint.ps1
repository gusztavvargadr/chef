chef install ./samples/policies/$($args[0])/Policyfile.rb
chef export ./samples/policies/$($args[0])/Policyfile.rb ./.chef/policies/$($args[0])/ --force
