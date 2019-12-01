FROM mcr.microsoft.com/windows/servercore:ltsc2019

WORKDIR /opt/gusztavvargadr/chef

RUN powershell -C iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'));

RUN choco install -y chef-client
ENV CHEF_LICENSE accept-silent

ARG policy
ARG directory

RUN echo cd ./.chef/policies/%directory%/%policy% >> ./entrypoint.ps1
RUN echo chef-client -z >> ./entrypoint.ps1

ENTRYPOINT [ "powershell" ]
CMD [ "-F", "./entrypoint.ps1" ]
