Write-Host "Install Chef Client"
. { iwr -useb https://omnitruck.chef.io/install.ps1 } | iex; install -project chef -version 16.1.16

Write-Host "Clean up"
rm -Recurse -Force $env:TEMP\*
