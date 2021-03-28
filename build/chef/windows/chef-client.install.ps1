. { iwr -useb https://omnitruck.chef.io/install.ps1 } | iex; install -project chef -version 16.10.17

$ErrorActionPreference = "Stop"

rm -Recurse -Force $env:LOCALAPPDATA\Temp\*

exit $LASTEXITCODE
