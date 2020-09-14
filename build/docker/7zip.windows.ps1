Write-Host "Install 7zip"
choco install 7zip.portable --confirm --no-progress

Write-Host "Clean up"
rm -Recurse -Force C:/tmp/chocolatey/*
