ARG TAG
FROM mcr.microsoft.com/windows/servercore:${TAG}

ADD ./windows.chocolatey.ps1 ./windows.chocolatey.ps1
RUN powershell -File .\windows.chocolatey.ps1

ADD ./windows.chef-client.ps1 ./windows.chef-client.ps1
RUN powershell -File .\windows.chef-client.ps1
