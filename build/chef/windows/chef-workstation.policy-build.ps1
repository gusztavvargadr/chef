$ErrorActionPreference = "Stop"

chef install ./samples/policies/$($args[0])/Policyfile.rb
chef export ./samples/policies/$($args[0])/Policyfile.rb ./artifacts/policies/$($args[0])/ --force

exit $LASTEXITCODE
