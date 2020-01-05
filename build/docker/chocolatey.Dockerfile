FROM mcr.microsoft.com/windows/servercore:ltsc2019

RUN powershell -Command iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'));

WORKDIR C:/opt/docker/

ENTRYPOINT [ "choco" ]
CMD [ "--help" ]
