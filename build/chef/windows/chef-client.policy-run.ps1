$ErrorActionPreference = "Stop"

cd ./artifacts/policies/$($args[0])/
chef-client -z

exit $LASTEXITCODE
