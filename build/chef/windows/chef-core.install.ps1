$ErrorActionPreference = "Stop"

$env:chocolateyVersion = "2.3.0"
Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-WebRequest https://chocolatey.org/install.ps1 -UseBasicParsing | Invoke-Expression

rm -Recurse -Force $env:LOCALAPPDATA\Temp\*

exit $LASTEXITCODE
