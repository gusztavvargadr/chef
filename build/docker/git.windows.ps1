Write-Host "Install Git"
choco install git --version 2.26.2 --package-parameters '"/GitAndUnixToolsOnPath /NoShellIntegration"' --confirm --no-progress
