Write-Host "Install 7zip"
choco install 7zip.portable --version 19.0 --confirm --no-progress

Write-Host "Install Git"
choco install git --version 2.26.2 --package-parameters '"/GitAndUnixToolsOnPath /NoShellIntegration"' --confirm --no-progress

Write-Host "Install Chef Workstation"
choco install chef-workstation --version 0.17.5 --confirm --no-progress
