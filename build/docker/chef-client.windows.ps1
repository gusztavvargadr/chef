Write-Host "Install Chef Client"
. { iwr -useb https://omnitruck.chef.io/install.ps1 } | iex; install -project chef -version 16.5.77

Write-Host "Clean up"
rm -Recurse -Force $env:TEMP/*
