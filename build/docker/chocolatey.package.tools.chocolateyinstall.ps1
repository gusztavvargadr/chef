$ErrorActionPreference = 'Stop';

Write-Host "Hello Install!"

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

pushd $toolsDir/policy
chef-client -z
popd
