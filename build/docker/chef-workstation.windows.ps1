Write-Host "Install Chef Workstation"
. { iwr -useb https://omnitruck.chef.io/install.ps1 } | iex; install -project chef-workstation -version 0.18.3

Write-Host "Clean up"
rm -Recurse -Force $env:TEMP\*
