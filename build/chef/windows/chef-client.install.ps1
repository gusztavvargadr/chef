. { iwr -useb https://omnitruck.chef.io/install.ps1 } | iex; install -project chef -version 17.1.35

$ErrorActionPreference = "Stop"

rm -Recurse -Force $env:LOCALAPPDATA\Temp\*

exit $LASTEXITCODE
