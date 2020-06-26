FROM mcr.microsoft.com/windows/servercore:ltsc2019

WORKDIR C:/opt/chocolatey/

ADD ./chocolatey-cli.windows.ps1 ./chocolatey-cli.ps1
RUN powershell -File .\chocolatey-cli.ps1
