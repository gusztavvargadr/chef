$ErrorActionPreference = 'Stop';

rm -Recurse -Force $env:CHOCOLATEY_PACKAGE_DIR
mkdir -Force $env:CHOCOLATEY_PACKAGE_DIR/tools/policy
cp -Recurse -Force $env:CHEF_EXPORT_DIR/* $env:CHOCOLATEY_PACKAGE_DIR/tools/policy
cp -Recurse -Force $env:CHOCOLATEY_SRC_DIR/* $env:CHOCOLATEY_PACKAGE_DIR

cd $env:CHOCOLATEY_PACKAGE_DIR
choco pack
