# FROM mcr.microsoft.com/windows/servercore:ltsc2019
FROM mcr.microsoft.com/windows/servercore:2004

WORKDIR C:/opt/chocolatey/

COPY ./chocolatey-cli.windows.ps1 C:/tmp/
RUN powershell -File C:/tmp/chocolatey-cli.windows.ps1

COPY ./7zip.windows.ps1 C:/tmp/
RUN powershell -File C:/tmp/7zip.windows.ps1
