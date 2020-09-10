Write-Host "Install Git"
choco install git --package-parameters '"/GitAndUnixToolsOnPath /NoAutoCrlf /NoShellIntegration /SChannel"' --confirm --no-progress

Write-Host "Clean up"
rm -Recurse -Force C:/tmp/chocolatey/*
