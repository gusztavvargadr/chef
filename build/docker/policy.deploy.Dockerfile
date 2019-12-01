FROM mcr.microsoft.com/windows/servercore:ltsc2019

ARG directory
ARG name

WORKDIR /opt/gusztavvargadr/chef

RUN powershell -C iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'));

RUN choco install -y chef-client
ENV CHEF_LICENSE accept-silent

RUN echo cd ./.chef/policies/%directory%%name% >> ./entrypoint.ps1
RUN echo chef-client -z >> ./entrypoint.ps1

ENTRYPOINT [ "powershell" ]
CMD [ "-F", "./entrypoint.ps1" ]
