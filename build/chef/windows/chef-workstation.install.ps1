. { iwr -useb https://omnitruck.chef.io/install.ps1 } | iex; install -project chef-workstation -version 21.6.497

$ErrorActionPreference = "Stop"

choco install git --package-parameters '"/GitAndUnixToolsOnPath /NoAutoCrlf /NoShellIntegration /SChannel"' --confirm --no-progress

pushd ./lib/test-kitchen/kitchen-docker
C:\opscode\chef-workstation\bin\chef-cli gem build --force ./kitchen-docker.gemspec
C:\opscode\chef-workstation\bin\chef-cli gem install --force --local ./kitchen-docker-2.10.0.gem
popd

rm -Recurse -Force $env:LOCALAPPDATA\Temp\*

exit $LASTEXITCODE
