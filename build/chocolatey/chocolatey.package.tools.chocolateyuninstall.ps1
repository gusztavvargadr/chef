$ErrorActionPreference = 'Stop'

Write-Host "Hello Uninstall!"

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

pushd $toolsDir/policy
chef-client -z
popd

exit $LASTEXITCODE
