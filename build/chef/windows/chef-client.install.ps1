. { iwr -useb https://omnitruck.chef.io/install.ps1 } | iex; install -project chef -version $($args[0])

$ErrorActionPreference = "Stop"

rm -Recurse -Force $env:LOCALAPPDATA\Temp\*

exit $LASTEXITCODE
