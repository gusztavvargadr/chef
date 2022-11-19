$ErrorActionPreference = "Stop"

$env:chocolateyVersion = '1.2.0'
Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-WebRequest https://chocolatey.org/install.ps1 -UseBasicParsing | Invoke-Expression

rm -Recurse -Force $env:LOCALAPPDATA\Temp\*

exit $LASTEXITCODE
