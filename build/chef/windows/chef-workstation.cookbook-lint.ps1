$ErrorActionPreference = "Stop"

chef exec cookstyle ./samples/cookbooks/$($args[0])/

exit $LASTEXITCODE
