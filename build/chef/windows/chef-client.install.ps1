$CHEF_CLIENT_VERSION="18.4.12"

. { iwr -useb https://omnitruck.chef.io/install.ps1 } | iex; install -project chef -version $CHEF_CLIENT_VERSION

$ErrorActionPreference = "Stop"

rm -Recurse -Force $env:LOCALAPPDATA\Temp\*

exit $LASTEXITCODE
