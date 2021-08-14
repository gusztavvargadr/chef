. { iwr -useb https://omnitruck.chef.io/install.ps1 } | iex; install -project chef-workstation -version $($args[0])

$ErrorActionPreference = "Stop"

choco install git --package-parameters '"/GitAndUnixToolsOnPath /NoAutoCrlf /NoShellIntegration /SChannel"' --confirm --no-progress

pushd ./lib/test-kitchen/kitchen-docker
C:\opscode\chef-workstation\bin\chef-cli gem build --force ./kitchen-docker.gemspec
C:\opscode\chef-workstation\bin\chef-cli gem install --force --local --no-user-install ./kitchen-docker-2.11.0.gem
popd

rm -Recurse -Force $env:LOCALAPPDATA\Temp\*

exit $LASTEXITCODE
