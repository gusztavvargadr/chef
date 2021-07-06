$ErrorActionPreference = "Stop"

chef exec rspec ./samples/cookbooks/$($args[0])/

exit $LASTEXITCODE
