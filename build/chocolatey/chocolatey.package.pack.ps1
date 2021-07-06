$ErrorActionPreference = 'Stop'

if (Test-Path -Path ./.chocolatey/packages/chef-policy/) {
  rm -Recurse -Force ./.chocolatey/packages/chef-policy/
}

mkdir -Force ./.chocolatey/packages/chef-policy/tools/policy/

cp -Force ./build/docker/chocolatey.package.chef-policy.nuspec ./.chocolatey/packages/chef-policy/chef-policy.nuspec

cp -Force ./build/docker/chocolatey.package.tools.chocolateyinstall.ps1 ./.chocolatey/packages/chef-policy/tools/chocolateyinstall.ps1
cp -Force ./build/docker/chocolatey.package.tools.chocolateyuninstall.ps1 ./.chocolatey/packages/chef-policy/tools/chocolateyuninstall.ps1

cp -Recurse -Force ./.chef/policies/$($args[0])/* ./.chocolatey/packages/chef-policy/tools/policy

choco pack ./.chocolatey/packages/chef-policy/chef-policy.nuspec --output-directory ./.chocolatey/packages/

exit $LASTEXITCODE
