FROM mcr.microsoft.com/windows/servercore:ltsc2019

WORKDIR C:/opt/docker/

RUN powershell -Command iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'));

ARG directory
ARG policy

ENV CHEF_EXPORT_DIR C:/opt/docker/.chef/policies/${directory}/${policy}/

ENV CHOCOLATEY_SRC_DIR C:/opt/docker/src/
ADD ./build/docker/chocolatey-package.nuspec ./src/sample-policy.nuspec
ADD ./build/docker/chocolatey-package.chocolateyinstall.ps1 ./src/tools/chocolateyinstall.ps1
ADD ./build/docker/chocolatey-package.chocolateyuninstall.ps1 ./src/tools/chocolateyuninstall.ps1

ENV CHOCOLATEY_PACKAGE_DIR C:/opt/docker/.chocolatey/packages/sample-policy-${directory}-${policy}/

ADD ./build/docker/chocolatey-package.entrypoint.ps1 ./entrypoint.ps1

ENTRYPOINT [ "powershell", "-File", "C:/opt/docker/entrypoint.ps1" ]
