Write-Host "Install Chef Client"
. { iwr -useb https://omnitruck.chef.io/install.ps1 } | iex; install -project chef -version 16.6.14

Write-Host "Clean up"
rm -Recurse -Force $env:TEMP/*
