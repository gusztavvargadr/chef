FROM chef/chefworkstation:0.11.21

ARG directory
ARG name

WORKDIR /opt/gusztavvargadr/chef

ENV CHEF_LICENSE accept-silent

ADD ./src/ ./src/
ADD ./samples/cookbooks/ ./samples/cookbooks/
ADD ./samples/policies/${directory}Policyfile.${name}* ./samples/policies/${directory}

RUN chef install ./samples/policies/${directory}Policyfile.${name}.rb

RUN echo chef export --force ./samples/policies/${directory}Policyfile.${name}.rb ./.chef/policies/${directory}${name} >> ./entrypoint.sh

ENTRYPOINT [ "sh" ]
CMD [ "./entrypoint.sh" ]
