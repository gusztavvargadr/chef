Write-Host "Install Git"
choco install git --version 2.26.2 --package-parameters '"/GitAndUnixToolsOnPath /NoAutoCrlf /NoShellIntegration /SChannel"' --confirm --no-progress

Write-Host "Clean up"
rm -Recurse -Force $env:TEMP\*
