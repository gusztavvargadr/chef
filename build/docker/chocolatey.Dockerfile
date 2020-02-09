FROM gusztavvargadr/chocolatey-cli:0.10.15-windows

# FROM mcr.microsoft.com/windows/servercore:ltsc2019

# WORKDIR C:/opt/chocolatey/

# $env:chocolateyVersion = '0.10.15'

# Set-ExecutionPolicy Bypass -Scope Process -Force
# Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# RUN powershell -Command iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'));
# RUN choco config set cacheLocation C:\tmp\choco

# ENTRYPOINT [ "choco" ]
# CMD [ "--help" ]
