$CHEF_CLIENT_VERSION="18.7.10"

. { iwr -useb https://omnitruck.chef.io/install.ps1 } | iex; install -project chef -version $CHEF_CLIENT_VERSION

$ErrorActionPreference = "Stop"

rm -Recurse -Force $env:LOCALAPPDATA\Temp\*

exit $LASTEXITCODE
