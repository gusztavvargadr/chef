Write-Host "Install Chocolatey"
$env:chocolateyVersion = '0.10.15'
Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-WebRequest https://chocolatey.org/install.ps1 -UseBasicParsing | Invoke-Expression
choco config set cacheLocation C:/tmp/chocolatey
