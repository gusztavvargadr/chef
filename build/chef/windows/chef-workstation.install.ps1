$CHEF_WORKSTATION_VERSION="23.5.1040"

. { iwr -useb https://omnitruck.chef.io/install.ps1 } | iex; install -project chef-workstation -version $CHEF_WORKSTATION_VERSION

$ErrorActionPreference = "Stop"

choco install git --package-parameters '"/NoShellIntegration /SChannel /NoOpenSSH"' --confirm --no-progress

rm -Recurse -Force $env:LOCALAPPDATA\Temp\*

exit $LASTEXITCODE
