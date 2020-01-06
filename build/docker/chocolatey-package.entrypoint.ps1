$ErrorActionPreference = 'Stop';

mkdir -Force $env:CHOCOLATEY_SRC_DIR/tools/policy
cp -Recurse -Force $env:CHEF_EXPORT_DIR/* $env:CHOCOLATEY_SRC_DIR/tools/policy

mkdir -Force $env:CHOCOLATEY_PACKAGE_DIR
pushd $env:CHOCOLATEY_SRC_DIR
choco pack --output-directory $env:CHOCOLATEY_PACKAGE_DIR
popd
