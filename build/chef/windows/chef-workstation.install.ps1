. { iwr -useb https://omnitruck.chef.io/install.ps1 } | iex; install -project chef-workstation -version $($args[0])

$ErrorActionPreference = "Stop"

choco install git --package-parameters '"/NoShellIntegration /SChannel /NoOpenSSH"' --confirm --no-progress

rm -Recurse -Force $env:LOCALAPPDATA\Temp\*

exit $LASTEXITCODE
