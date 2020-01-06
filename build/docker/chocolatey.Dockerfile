FROM mcr.microsoft.com/windows/servercore:ltsc2019

WORKDIR C:/opt/docker/

RUN powershell -Command iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'));

ENTRYPOINT [ "choco" ]
CMD [ "--help" ]
