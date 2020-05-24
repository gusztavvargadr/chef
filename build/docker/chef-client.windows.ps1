Write-Host "Install 7zip"
choco install 7zip.portable --version 19.0 --confirm --no-progress

Write-Host "Install Chef Client"
choco install chef-client --version 15.8.23 --confirm --no-progress
